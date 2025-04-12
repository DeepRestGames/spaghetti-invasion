extends Node3D


var player: Player


func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player") as Player
	pass


func _process(_delta: float) -> void:
	if player:
		look_at(player.global_position)
