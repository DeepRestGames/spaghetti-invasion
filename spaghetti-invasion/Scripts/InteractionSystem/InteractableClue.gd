class_name InteractableClue
extends StaticBody3D


@export var clue_data: ClueData
@export var disappear_when_interacted: bool

@onready var particles = $GPUParticles3D


func interact():
	if(clue_data == null):
		printerr("The interactable is missing a ClueData object!")
	else:
		EventBus.emit_signal("clue_interacted", clue_data)
		particles.emitting = false
		if disappear_when_interacted:
			hide()
	
	EventBus.emit_signal("looking_at_interactable", false)
	collision_layer = 0
