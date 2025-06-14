extends Node


const main_menu_path = "res://Scenes/GUI/MainMenu.tscn"

var path_to_new_scene := ""

## Keeps  track of loading progress. Useful for loading progress bars and loading screens
var progress_array: Array


func _ready() -> void:
	EventBus.connect("splash_screen_end", on_splash_screen_end)
	EventBus.connect("go_to_main_menu", go_to_main_menu)


func on_splash_screen_end() -> void:
	path_to_new_scene = main_menu_path
	ResourceLoader.load_threaded_request(path_to_new_scene)


func go_to_main_menu() -> void:
	path_to_new_scene = main_menu_path
	ResourceLoader.load_threaded_request(path_to_new_scene)


func _process(_delta: float) -> void:
	if path_to_new_scene == "":
		return
	
	var loading_progress = ResourceLoader.load_threaded_get_status(path_to_new_scene, progress_array)
	
	if loading_progress == ResourceLoader.THREAD_LOAD_LOADED:
		get_tree().change_scene_to_packed(ResourceLoader.load_threaded_get(path_to_new_scene))
		path_to_new_scene = ""
