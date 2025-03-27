extends RayCast3D


var was_just_colliding = false
var interactable_clue: InteractableClue = null


func _unhandled_key_input(event: InputEvent) -> void:
	if(event.is_action_pressed("interact") and interactable_clue != null):
		interactable_clue.interact()
		interactable_clue = null


func _process(_delta: float) -> void:
	if(is_colliding()):
		interactable_clue = get_collider() as InteractableClue
		
		if(interactable_clue == null):
			return
		
		EventBus.emit_signal("looking_at_interactable", true)
		was_just_colliding = true
	
	elif(was_just_colliding):
		EventBus.emit_signal("looking_at_interactable", false)
