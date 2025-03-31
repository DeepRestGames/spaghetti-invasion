extends Node3D


# Diary entries addition
enum LastPageWritten {
	BLANK,
	LEFT,
	RIGHT
}
var last_page_written: LastPageWritten = LastPageWritten.BLANK
@onready var left_pages_content = $Body/LeftCoverPivot/LeftPages/Content/SubViewport
@onready var right_pages_content = $Body/RightCoverPivot/RightPages/Content/SubViewport
var discovered_diary_pages: Array[DiaryPage]
@onready var empty_diary_page_scene = preload("res://Scenes/Diary/DiaryPages/EmptyDiaryPage.tscn")

var all_diary_entries_path = "res://Scenes/Diary/DiaryPages/"
var all_diary_entries: Array


var is_diary_out = false
@onready var animation_player = $AnimationPlayer


func _ready() -> void:
	# Load all clues entries scenes from folder
	all_diary_entries = load_clues_entries(all_diary_entries_path)
	
	EventBus.connect("clue_interacted", add_clue_entry)
	EventBus.connect("new_area_discovered", add_diary_page)


func load_clues_entries(path):
	var scene_loads = []

	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				var subdirectory_path = path + "/" + file_name
				scene_loads.append_array(load_clues_entries(subdirectory_path))
			else:
				if file_name.get_extension() == "tscn":
					var full_path = path.path_join(file_name)
					var packed_scene = load(full_path)
					var instance = packed_scene.instantiate() as DiaryEntry
					scene_loads.append(instance)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
	
	return scene_loads


func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed("use_diary"):
		if is_diary_out:
			put_away()
		else:
			pull_out()
		
		is_diary_out = !is_diary_out


func put_away():
	animation_player.play_backwards("appear")
	EventBus.emit_signal("focus_on_diary", false)


func pull_out():
	animation_player.play("appear")
	EventBus.emit_signal("focus_on_diary", true)


func add_diary_page(area_name: ClueData.DiaryPages):
	# Add page to discovered diary pages
	var new_diary_page = empty_diary_page_scene.instantiate()
	discovered_diary_pages.append(new_diary_page)
	
	# Change DiaryPage Label text
	new_diary_page.diary_page_ID = area_name
	
	 # Check add left or right page
	if(last_page_written == LastPageWritten.BLANK or last_page_written == LastPageWritten.RIGHT):
		left_pages_content.add_child(new_diary_page)
		last_page_written = LastPageWritten.LEFT
	else:
		right_pages_content.add_child(new_diary_page)
		last_page_written = LastPageWritten.RIGHT


func add_clue_entry(clue_data: ClueData):
	# Search for diary page
	var new_entry_diary_page: DiaryPage
	var new_diary_entry: DiaryEntry
	
	for page in discovered_diary_pages:
		if page.diary_page_ID == clue_data.diary_page_ID:
			new_entry_diary_page = page
			break
	if new_entry_diary_page == null:
		printerr("No diary page found for interacted clue!")
		return
	
	# Search for diary entry scene
	for entry in all_diary_entries:
		if entry.clue_ID == clue_data.clue_ID:
			new_diary_entry = entry
			break
	if new_diary_entry == null:
		printerr("No diary entry found for interacted clue!")
		return	
	# Add entry to diary page
	new_entry_diary_page.add_child(new_diary_entry)
