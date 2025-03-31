extends Area3D


@export var area_name: ClueData.DiaryPages

var area_discovered := false


func _on_body_entered(body: Node3D) -> void:
	if(!area_discovered and body.name == "Player"):
		EventBus.emit_signal("new_area_discovered", area_name)
		area_discovered = true
