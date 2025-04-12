extends Node3D


@export var aliens: Array[Node3D]

var already_triggered = false


func _on_enter_trigger_area_body_entered(body: Node3D) -> void:
	if already_triggered:
		return
	
	if(body.name == "Player"):
		for alien in aliens:
			alien.show()
		
		already_triggered = true


func _on_exit_trigger_area_body_entered(body: Node3D) -> void:
	if(body.name == "Player"):
		for alien in aliens:
			alien.hide()
