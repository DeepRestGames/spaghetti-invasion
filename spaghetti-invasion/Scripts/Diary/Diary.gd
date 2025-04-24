class_name Diary
extends Node3D

# Diary entries addition
enum LastPageWritten {
	BLANK,
	LEFT,
	RIGHT
}
var last_page_written: LastPageWritten = LastPageWritten.BLANK
@onready var left_page_content = $Body/LeftCoverPivot/LeftPages/Content/SubViewport
@onready var right_page_content = $Body/RightCoverPivot/RightPages/Content/SubViewport
var discovered_diary_pages: Array[DiaryPage]
@onready var empty_diary_page_scene = preload("res://Scenes/Diary/EmptyDiaryPage.tscn")
var current_diary_page = 0

var all_diary_entries_packed_scenes = [
	preload("res://Scenes/Diary/DiaryPages/CapannoCacciatori/DisegnoBambiniPonte.tscn"),
	preload("res://Scenes/Diary/DiaryPages/CapannoCacciatori/FucileCaccia.tscn"),
	preload("res://Scenes/Diary/DiaryPages/CapannoCacciatori/PortaSfondata.tscn"),
	preload("res://Scenes/Diary/DiaryPages/Cascata/OcchialiLuigino.tscn"),
	preload("res://Scenes/Diary/DiaryPages/Cascata/ScarpaDonna.tscn"),
	preload("res://Scenes/Diary/DiaryPages/Cascata/SolchiTerreno.tscn"),
	preload("res://Scenes/Diary/DiaryPages/Chiesa/DisegnoPonteChiesa.tscn"),
	preload("res://Scenes/Diary/DiaryPages/Chiesa/PiantaAliena.tscn"),
	preload("res://Scenes/Diary/DiaryPages/ContradaAbbandonata/FotoFamiglia.tscn"),
	preload("res://Scenes/Diary/DiaryPages/ContradaAbbandonata/DipintoCascata.tscn"),
	preload("res://Scenes/Diary/DiaryPages/ContradaAbbandonata/ForiProiettili.tscn"),
	preload("res://Scenes/Diary/DiaryPages/ContradaAbbandonata/LiquidoGiallo.tscn"),
	preload("res://Scenes/Diary/DiaryPages/DiarioAbbandonato/DiarioAgnese.tscn"),
	preload("res://Scenes/Diary/DiaryPages/Ponte/DisegnoTunnel.tscn"),
	preload("res://Scenes/Diary/DiaryPages/Ponte/Matite.tscn"),
	preload("res://Scenes/Diary/DiaryPages/ContradaAbbandonata/DipintoCascata.tscn"),
	preload("res://Scenes/Diary/DiaryPages/ValleOscura/PartiteNascondino.tscn"),
	preload("res://Scenes/Diary/DiaryPages/ValleOscura/RosarioCrocifisso.tscn"),
	preload("res://Scenes/Diary/DiaryPages/ValleOscura/SangueValle.tscn"),
]
var all_diary_entries: Array

static var is_diary_out = false
@onready var animation_player = $AnimationPlayer

@export var look_at_diary_cooldown = 30
var current_look_at_diary_cooldown = 2
var unread_clues = false


func _ready() -> void:
	instantiate_diary_entries()
	
	EventBus.connect("clue_interacted", add_clue_entry)
	EventBus.connect("new_area_discovered", add_diary_page)


func instantiate_diary_entries() -> void:
	for packed_scene in all_diary_entries_packed_scenes:
		var instance = packed_scene.instantiate() as DiaryEntry
		all_diary_entries.append(instance)


func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed("use_diary"):
		if is_diary_out:
			put_away()
		else:
			pull_out()
	
	if is_diary_out:
		if event.is_action_pressed("left"):
			turn_page(false)
		if event.is_action_pressed("right"):
			turn_page(true)
	
	if event.is_action_pressed("esc"):
		if is_diary_out:
			put_away()


func _process(delta: float) -> void:
	current_look_at_diary_cooldown -= delta
	if unread_clues:
		current_look_at_diary_cooldown -= delta
		if current_look_at_diary_cooldown <= 0:
			EventBus.emit_signal("show_open_diary_hint")
			current_look_at_diary_cooldown = look_at_diary_cooldown


func put_away():
	animation_player.play_backwards("appear")
	is_diary_out = false
	EventBus.emit_signal("focus_on_diary", false)


func pull_out():
	animation_player.play("appear")
	is_diary_out = true
	unread_clues = false
	EventBus.emit_signal("focus_on_diary", true)


func add_diary_page(area_name: ClueData.DiaryPages) -> DiaryPage:
	# Add page to discovered diary pages
	var new_diary_page = empty_diary_page_scene.instantiate()
	new_diary_page.diary_page_number = discovered_diary_pages.size()
	discovered_diary_pages.append(new_diary_page)
	
	# Change DiaryPage Label text
	new_diary_page.diary_page_ID = area_name
	
	 # Check add left or right page
	if(last_page_written == LastPageWritten.BLANK or last_page_written == LastPageWritten.RIGHT):
		left_page_content.add_child(new_diary_page)
		if(last_page_written == LastPageWritten.RIGHT):
			go_to_page(discovered_diary_pages.size() - 1)
		last_page_written = LastPageWritten.LEFT
	
	elif(last_page_written == LastPageWritten.LEFT):
		right_page_content.add_child(new_diary_page)
		last_page_written = LastPageWritten.RIGHT
	
	current_look_at_diary_cooldown = 2
	unread_clues = true
	
	return new_diary_page


func add_clue_entry(clue_data: ClueData):
	# Search for diary page
	var diary_page: DiaryPage
	var new_diary_entry: DiaryEntry
	
	for page in discovered_diary_pages:
		if page.diary_page_ID == clue_data.diary_page_ID:
			diary_page = page
			break
	if diary_page == null:
		#printerr("No diary page found for new clue!")
		diary_page = add_diary_page(clue_data.diary_page_ID)
	
	# Go to found diary page
	go_to_page(diary_page.diary_page_number)
	
	# Search for diary entry scene
	for entry in all_diary_entries:
		if entry.clue_ID == clue_data.clue_ID:
			new_diary_entry = entry
			break
	if new_diary_entry == null:
		printerr("No diary entry found for new clue!")
		return
	
	# Add entry to diary page
	diary_page.add_new_entry(new_diary_entry)
	diary_page.load_page()
	
	current_look_at_diary_cooldown = 2
	unread_clues = true


func clear_current_pages() -> void:
	var page_content_to_remove
	
	if left_page_content.get_child_count() > 0:
		page_content_to_remove = left_page_content.get_child(0)
		left_page_content.remove_child(page_content_to_remove)
	if right_page_content.get_child_count() > 0:
		page_content_to_remove = right_page_content.get_child(0)
		right_page_content.remove_child(page_content_to_remove)


func go_to_page(page: int) -> void:
	# Always point to left page to keep track of which one should be displayed
	if page % 2 != 0:
		current_diary_page = page - 1
	else:
		current_diary_page = page
	
	clear_current_pages()
	
	if(discovered_diary_pages[current_diary_page].get_parent() == null):
		left_page_content.add_child(discovered_diary_pages[current_diary_page])
	else:
		discovered_diary_pages[current_diary_page].reparent(left_page_content)
	
	# This means there's another page to load on the right
	if discovered_diary_pages.size() >= current_diary_page + 2:
		if(discovered_diary_pages[current_diary_page + 1].get_parent() == null):
			right_page_content.add_child(discovered_diary_pages[current_diary_page + 1])
		else:
			discovered_diary_pages[current_diary_page + 1].reparent(right_page_content)


func turn_page(right: bool) -> void:
	# Left limit
	if (current_diary_page == 0 and !right):
		printerr("No pages left to turn!")
		return
	# Right limit
	if (current_diary_page >= discovered_diary_pages.size() - 2 and right):
		printerr("No pages left to turn!")
		return
	
	if right:
		go_to_page(current_diary_page + 2)
	else:
		go_to_page(current_diary_page - 2)
