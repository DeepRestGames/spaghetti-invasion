extends Area3D


@export var area_ambience: AudioManager.AmbienceTracks


func _on_body_entered(body: Node3D) -> void:
	if(body.name == "Player"):
		EventBus.emit_signal("play_area_ambience", area_ambience)
