class_name HUD
extends Control


@onready var fps_label = $FPSLabel
@onready var interaction_prompt = $InteractionPrompt
@onready var pause_menu = $PauseMenu
@onready var open_diary_hint = $OpenDiaryHint
@onready var close_diary_hint = $CloseDiaryHint
@onready var turn_diary_page_hints = $TurnDiaryPageHints

@onready var new_diary_entry_message = $DiaryUpdateMessage/NewDiaryEntryMessage
@onready var new_area_discovered_message = $DiaryUpdateMessage/NewAreaDiscoveredMessage

var prompt_fade_time = .5


func _ready() -> void:
	EventBus.connect("looking_at_interactable", show_interaction_prompt)
	EventBus.connect("clue_interacted", show_new_diary_entry_message)
	EventBus.connect("new_area_discovered", show_new_area_discovered_message)
	EventBus.connect("show_open_diary_hint", show_open_diary_hint)
	EventBus.connect("focus_on_diary", show_opened_diary_hints)


func _process(_delta):
	if fps_label.is_visible_in_tree():
		fps_label.text = str(Engine.get_frames_per_second())


func _unhandled_key_input(_event):
	# DEBUGGING PURPOSES
	if Input.is_action_just_pressed("esc"):
		if Diary.is_diary_out:
			return
		
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
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	if(show_prompt):
		open_diary_hint.hide()
		tween.tween_property(interaction_prompt, "modulate", Color(1, 1, 1, 1), prompt_fade_time)
	else:
		open_diary_hint.show()
		tween.tween_property(interaction_prompt, "modulate", Color(1, 1, 1, 0), prompt_fade_time)


func show_new_diary_entry_message(_clue_data) -> void:
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(new_diary_entry_message, "modulate", Color(1, 1, 1, 1), prompt_fade_time)
	tween.chain().tween_interval(2)
	tween.tween_property(new_diary_entry_message, "modulate", Color(1, 1, 1, 0), prompt_fade_time)


func show_new_area_discovered_message(_area_name) -> void:
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(new_area_discovered_message, "modulate", Color(1, 1, 1, 1), prompt_fade_time)
	tween.chain().tween_interval(2)
	tween.tween_property(new_area_discovered_message, "modulate", Color(1, 1, 1, 0), prompt_fade_time)


func show_open_diary_hint() -> void:
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(open_diary_hint, "modulate", Color(1, 1, 1, 1), prompt_fade_time)
	tween.chain().tween_interval(2)
	tween.tween_property(open_diary_hint, "modulate", Color(1, 1, 1, 0), prompt_fade_time)


func show_opened_diary_hints(show_hints: bool) -> void:
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	if show_hints:
		open_diary_hint.hide()
		tween.tween_interval(1)
		
		tween.chain().tween_property(turn_diary_page_hints, "modulate", Color(1, 1, 1, 0), prompt_fade_time)
		tween.parallel().tween_property(close_diary_hint, "modulate", Color(1, 1, 1, 0), prompt_fade_time)
		await tween.chain().tween_interval(5).finished
		open_diary_hint.show()
	else:
		tween.tween_property(turn_diary_page_hints, "modulate", Color(1, 1, 1, 0), prompt_fade_time)
		tween.parallel().tween_property(close_diary_hint, "modulate", Color(1, 1, 1, 0), prompt_fade_time)
