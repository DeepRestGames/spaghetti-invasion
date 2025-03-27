extends Node3D


var is_diary_out = false


@onready var animation_player = $AnimationPlayer


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
