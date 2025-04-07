extends Area3D


#@export var area_entered_cooldown = 5
#var current_area_entered_cooldown = 0
#var just_entered_area = false
#
#
#func _process(delta: float) -> void:
	#if just_entered_area:
		#current_area_entered_cooldown -= delta
		#
		#if current_area_entered_cooldown <= 0:
			#just_entered_area = false
#
#
#func _on_body_entered(body: Node3D) -> void:
	#if(body.name == "Player"):
		#EventBus.emit_signal("play_forest_ambience", true)
		#just_entered_area = true
		#current_area_entered_cooldown = area_entered_cooldown
#
#
#func _on_body_exited(body: Node3D) -> void:
	#if(body.name == "Player"):
		#EventBus.emit_signal("play_forest_ambience", false)


@export var area_ambience: AudioManager.AmbienceTracks


func _on_body_entered(body: Node3D) -> void:
	if(body.name == "Player"):
		EventBus.emit_signal("play_area_ambience", area_ambience)
