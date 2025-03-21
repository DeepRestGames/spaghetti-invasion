extends Node3D


var is_diary_out = false


@onready var animation_player = $AnimationPlayer

@onready var right_page = $Body/PagesPivot/Right
@onready var left_page = $Body/Pages2Pivot/Left

@onready var tags = $Tags
@onready var collider_box_codex = $Tags/Codex/ColliderBox
@onready var collider_box_studies = $Tags/Studies/ColliderBox
@onready var collider_box_options = $Tags/Options/ColliderBox


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
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func pull_out():
	animation_player.play("appear")
	EventBus.emit_signal("focus_on_diary", true)
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func show_tags():
	tags.show()
	collider_box_codex.use_collision = true
	collider_box_studies.use_collision = true
	collider_box_options.use_collision = true


func hide_tags():
	tags.hide()
	collider_box_codex.use_collision = false
	collider_box_studies.use_collision = false
	collider_box_options.use_collision = false


func _on_codex_tag_pressed():
	pass


func _on_studies_tag_pressed():
	pass
