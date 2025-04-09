extends Node3D


@onready var alien = $Alien

var already_triggered = false


func _on_enter_trigger_area_body_entered(body: Node3D) -> void:
	if already_triggered:
		return
	
	if(body.name == "Player"):
		alien.show()
		already_triggered = true


func _on_exit_trigger_area_body_entered(body: Node3D) -> void:
	if(body.name == "Player"):
		alien.hide()
