class_name HUD
extends Control


@onready var fps_label = $FPSLabel

@onready var pause_menu = $PauseMenu
@onready var options_menu = $OptionsMenu


func _process(_delta):
	if fps_label.is_visible_in_tree():
		fps_label.text = str(Engine.get_frames_per_second())


#func _unhandled_key_input(_event):
	
	# DEBUGGING PURPOSES
#	if Input.is_action_just_pressed("pause"):
#		if pause_menu.is_visible_in_tree():
#			_on_resume_button_pressed()
#		elif options_menu.is_visible_in_tree():
#			_on_options_back_button_pressed()
#		else:
#			pause_menu.show()
#			get_tree().paused = true
#			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


# Pause menu
func _on_resume_button_pressed():
	pause_menu.hide()
	get_tree().paused = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _on_main_menu_button_pressed():
	_on_resume_button_pressed()


func _on_options_button_pressed():
	pause_menu.hide()
	options_menu.show()


func _on_close_button_pressed():
	get_tree().quit()


func _on_fps_check_button_toggled(toggled_on):
	if toggled_on:
		fps_label.show()
	else:
		fps_label.hide()


func _on_options_back_button_pressed():
	options_menu.hide()
	pause_menu.show()

