extends Node3D


var player: Player

@export var children_laugh_sfx: Array[AudioStream]

@onready var laugh_sfx = $LaughSFX
@export var laugh_sfx_play_chance = 0.01
@export var laugh_sfx_play_cooldown = 5
@export var laugh_sfx_volume_db = -20
var laugh_sfx_current_cooldown = 0


func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player") as Player


func _process(delta: float) -> void:
	if !self.visible:
		return
	
	if player:
		look_at(player.global_position)
	
	laugh_sfx_current_cooldown -= delta
	if(!laugh_sfx.playing and laugh_sfx_current_cooldown <= 0):
		if randf_range(0, 1) <= laugh_sfx_play_chance:
			laugh_sfx.stream = children_laugh_sfx.pick_random()
			
			laugh_sfx.pitch_scale = randf_range(.85, 1)
			laugh_sfx.volume_db = laugh_sfx_volume_db + randf_range(-5, 1)
			laugh_sfx.play()
			laugh_sfx_current_cooldown = laugh_sfx_play_cooldown
