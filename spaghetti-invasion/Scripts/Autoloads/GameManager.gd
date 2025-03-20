extends Node


var world_environment: WorldEnvironment = null


func _ready() -> void:
	EventBus.connect("gamma_value_changed", on_gamma_value_changed)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("restart"):
		get_tree().reload_current_scene()


func on_gamma_value_changed(new_value: float) -> void:
	if world_environment == null:
		world_environment = get_tree().get_first_node_in_group("WorldEnvironment") as WorldEnvironment
	
	world_environment.environment.tonemap_exposure = new_value
