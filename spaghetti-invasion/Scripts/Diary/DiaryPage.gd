class_name DiaryPage
extends Control


@onready var page_title = $PageTitle
@onready var page_entries = $PageEntries

var diary_page_ID: ClueData.DiaryPages
var discovered_page_entries_scenes: Array[DiaryEntry]
var diary_page_number: int


func _ready() -> void:
	var diary_page_name: String = ClueData.DiaryPages.keys()[diary_page_ID]
	page_title.text = diary_page_name.replace("_", " ")
	load_page()


func add_new_entry(new_entry_scene: DiaryEntry):
	discovered_page_entries_scenes.append(new_entry_scene)


func clear_page() -> void:
	if page_entries == null or page_entries.get_child_count() == 0:
		return
	
	for entry in page_entries.get_children():
		page_entries.remove_child(entry)


func load_page() -> DiaryPage:
	clear_page()
	
	for entry in discovered_page_entries_scenes:
		page_entries.add_child(entry)
	
	return self
