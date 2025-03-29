extends Node3D


# Diary entries addition
enum LastPageWritten {
	BLANK,
	LEFT,
	RIGHT
}
var last_page_written: LastPageWritten = LastPageWritten.BLANK
@onready var left_pages_content = $Body/LeftCoverPivot/LeftPages/Content/SubViewport
#@onready var right_pages_content = $BoBody/LeftCoverPivot/LeftPages/Content
var diary_pages: Array[DiaryPage]

var diary_entries_path = "res://Scenes/Diary/DiaryPages/"
var diary_entries: Array


var is_diary_out = false
@onready var animation_player = $AnimationPlayer


func _ready() -> void:
	# Load all clues entries scenes from folder
	diary_entries = load_clues_entries(diary_entries_path)
	
	# TEST
	diary_pages.append($Body/LeftCoverPivot/LeftPages/Content/SubViewport/DiaryPage_ContradaAbbandonata)
	
	EventBus.connect("clue_interacted", add_clue_entry)


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


#func add_diary_page()


func add_clue_entry(clue_data: ClueData):
	# Search for diary page
	var diary_page: DiaryPage
	var diary_entry: DiaryEntry
	
	for page in diary_pages:
		if page.diary_page_ID == clue_data.diary_page_ID:
			diary_page = page
			break
	if diary_page == null:
		printerr("No diary page found for interacted clue!")
		return
	
	# Search for diary entry scene
	for entry in diary_entries:		
		if entry.clue_ID == clue_data.clue_ID:
			diary_entry = entry
			break
	if diary_entry == null:
		printerr("No diary entry found for interacted clue!")
		return	
	# Add entry to diary page
	diary_page.add_child(diary_entry)
