class_name HUD
extends Control


@onready var fps_label = $FPSLabel
@onready var interaction_prompt = $InteractionPrompt
@onready var pause_menu = $PauseMenu


func _ready() -> void:
	EventBus.connect("looking_at_interactable", show_interaction_prompt)


func _process(_delta):
	if fps_label.is_visible_in_tree():
		fps_label.text = str(Engine.get_frames_per_second())


func _unhandled_key_input(_event):
	# DEBUGGING PURPOSES
	if Input.is_action_just_pressed("pause"):
		if pause_menu.is_visible_in_tree():
			_on_resume_button_pressed()
		else:
			pause_menu.show()
			get_tree().paused = true
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


# Pause menu
func _on_resume_button_pressed():
	pause_menu.hide()
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	get_tree().paused = false


func _on_main_menu_button_pressed():
	_on_resume_button_pressed()


func _on_options_button_pressed():
	print("OPTIONS BUTTON PRESSED!")


func _on_close_button_pressed():
	get_tree().quit()


func _on_options_back_button_pressed():
	print("OPTIONS BUTTON BACK PRESSED!")


func _on_gamma_slider_value_changed(value: float) -> void:
	EventBus.emit_signal("gamma_value_changed", value)


func show_interaction_prompt(show_prompt) -> void:
	if(show_prompt):
		interaction_prompt.show()
	else:
		interaction_prompt.hide()
