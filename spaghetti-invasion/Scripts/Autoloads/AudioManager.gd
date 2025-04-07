extends Node


enum MusicTracks {
	INTRO,
	INTRO_LOOP,
}


enum AmbienceTracks {
	FOREST,
	HOUSES,
	CLEARING,
	CAVE,
	LAKE
}

# Music
@onready var music_stream_player = $Music

# SFX
@export_category("Alien SFX")
@onready var black_hole = $SFX/Alien/BlackHole
@export var black_hole_target_volume_db = -20

@onready var ghost_voice = $SFX/Alien/GhostVoice
@export var ghost_voice_target_volume_db = -10

@onready var parker_probe1 = $SFX/Alien/ParkerSolarProbe1
@export var parker_probe1_target_volume_db = -20

@onready var parker_probe2 = $SFX/Alien/ParkerSolarProbe2
@export var parker_probe2_target_volume_db = -20

@onready var parker_probe_langmuir = $SFX/Alien/ParkerSolarProbe_LangmuirWaves
@export var parker_probe_langmuir_target_volume_db = -20

@onready var phase_sweeper = $SFX/Alien/PhaseSweeper
@export var phase_sweeper_target_volume_db = -20

@onready var saturn_radio = $SFX/Alien/SaturnRadioEmissions
@export var saturn_radio_target_volume_db = -20

@onready var sun_sonification = $SFX/Alien/SunSonification
@export var sun_sonification_target_volume_db = -20

@onready var voyager_plasma = $SFX/Alien/VoyagerPlasmaSounds
@export var voyager_plasma_target_volume_db = -30

@export_category("Natural SFX")
@onready var crickets_long = $SFX/Natural/CricketsLong
@export var crickets_long_target_volume_db = -30

@onready var soft_wind1 = $SFX/Natural/SoftWind1
@export var soft_wind1_target_volume_db = -30

@onready var soft_wind2 = $SFX/Natural/SoftWind2
@export var soft_wind2_target_volume_db = -30

@export_category("One Shot SFX")
@onready var bird_chirp_very_far = $SFX/Natural/BirdChirpVeryFar
@export var bird_chirp_very_far_play_chance = 0.01
@export var bird_chirp_very_far_play_cooldown = 5
@export var bird_chirp_very_far_volume_db = -10
var bird_chirp_very_far_should_play = false
var bird_chirp_very_far_current_cooldown = 0
var bird_chirp_very_far_panner_effect = AudioServer.get_bus_effect(3, 0)

@onready var dog_bark1 = $SFX/Natural/DogBark1
@export var dog_bark1_play_chance = 0.005
@export var dog_bark1_play_cooldown = 10
@export var dog_bark1_volume_db = -15
var dog_bark1_should_play = false
var dog_bark1_current_cooldown = 0
var dog_bark1_panner_effect = AudioServer.get_bus_effect(4, 0)

@onready var dog_bark2 = $SFX/Natural/DogBark2
@export var dog_bark2_play_chance = 0.005
@export var dog_bark2_play_cooldown = 10
@export var dog_bark2_volume_db = -15
var dog_bark2_should_play = false
var dog_bark2_current_cooldown = 0
var dog_bark2_panner_effect = AudioServer.get_bus_effect(5, 0)

@onready var dog_bark3 = $SFX/Natural/DogBark3
@export var dog_bark3_play_chance = 0.
@export var dog_bark3_play_cooldown = 10
@export var dog_bark3_volume_db = -15
var dog_bark3_should_play = false
var dog_bark3_current_cooldown = 0
var dog_bark3_panner_effect = AudioServer.get_bus_effect(6, 0)

@onready var owl_hooting = $SFX/Natural/OwlHooting
@export var owl_hooting_play_chance = 0.01
@export var owl_hooting_play_cooldown = 10
@export var owl_hooting_volume_db = -10
var owl_hooting_should_play = false
var owl_hooting_current_cooldown = 0
var owl_hooting_panner_effect = AudioServer.get_bus_effect(7, 0)

@onready var crickets_short = $SFX/Natural/CricketsShort
@export var crickets_short_play_chance = 0.01
@export var crickets_short_play_cooldown = 5
@export var crickets_short_volume_db = -15
var crickets_short_should_play = false
var crickets_short_current_cooldown = 0
var crickets_short_panner_effect = AudioServer.get_bus_effect(8, 0)

# General variables
var min_stream_volume_db = -80.0
var fading_time = 10


func _ready() -> void:
	EventBus.connect("play_music", play_music)
	EventBus.connect("play_area_ambience", play_area_ambience)


func _process(delta: float) -> void:
	
	# Calculate SFX play chance
	if(bird_chirp_very_far_should_play):
		bird_chirp_very_far_current_cooldown -= delta
		if(!bird_chirp_very_far.playing and bird_chirp_very_far_current_cooldown <= 0):
			if randf_range(0, 1) <= bird_chirp_very_far_play_chance:
				bird_chirp_very_far_panner_effect.pan = randf_range(-1, 1)
				bird_chirp_very_far.pitch_scale = randf_range(.85, 1)
				bird_chirp_very_far.volume_db = bird_chirp_very_far_volume_db + randf_range(-5, 1)
				bird_chirp_very_far.play()
				bird_chirp_very_far_current_cooldown = bird_chirp_very_far_play_cooldown
	
	if(dog_bark1_should_play):
		dog_bark1_current_cooldown -= delta
		if(!dog_bark1.playing and dog_bark1_current_cooldown <= 0):
			if randf_range(0, 1) <= dog_bark1_play_chance:
				dog_bark1_panner_effect.pan = randf_range(-1, 1)
				dog_bark1.pitch_scale = randf_range(.9, 1)
				dog_bark1.volume_db = dog_bark1_volume_db + randf_range(-5, 1)
				dog_bark1.play()
				dog_bark1_current_cooldown = dog_bark1_play_cooldown
	
	if(dog_bark2_should_play):
		dog_bark2_current_cooldown -= delta
		if(!dog_bark2.playing and dog_bark2_current_cooldown <= 0):
			if randf_range(0, 1) <= dog_bark2_play_chance:
				dog_bark2_panner_effect.pan = randf_range(-1, 1)
				dog_bark2.pitch_scale = randf_range(.9, 1)
				dog_bark2.volume_db = dog_bark2_volume_db + randf_range(-5, 1)
				dog_bark2.play()
				dog_bark2_current_cooldown = dog_bark2_play_cooldown
	
	if(dog_bark3_should_play):
		dog_bark3_current_cooldown -= delta
		if(!dog_bark3.playing and dog_bark3_current_cooldown <= 0):
			if randf_range(0, 1) <= dog_bark3_play_chance:
				dog_bark3_panner_effect.pan = randf_range(-1, 1)
				dog_bark3.pitch_scale = randf_range(.9, 1)
				dog_bark3.volume_db = dog_bark3_volume_db + randf_range(-5, 1)
				dog_bark3.play()
				dog_bark3_current_cooldown = dog_bark3_play_cooldown
	
	if(owl_hooting_should_play):
		owl_hooting_current_cooldown -= delta
		if(!owl_hooting.playing and owl_hooting_current_cooldown <= 0):
			if randf_range(0, 1) <= owl_hooting_play_chance:
				owl_hooting_panner_effect.pan = randf_range(-1, 1)
				owl_hooting.pitch_scale = randf_range(.85, 1)
				owl_hooting.volume_db = owl_hooting_volume_db + randf_range(-5, 1)
				owl_hooting.play()
				owl_hooting_current_cooldown = owl_hooting_play_cooldown
	
	if(crickets_short_should_play):
		crickets_short_current_cooldown -= delta
		if(!crickets_short.playing and crickets_short_current_cooldown <= 0):
			if randf_range(0, 1) <= crickets_short_play_chance:
				crickets_short_panner_effect.pan = randf_range(-1, 1)
				crickets_short.pitch_scale = randf_range(.85, 1)
				crickets_short.volume_db = crickets_short_volume_db + randf_range(-5, 1)
				crickets_short.play()
				crickets_short_current_cooldown = crickets_short_play_cooldown


func play_music(music_track: MusicTracks) -> void:
	pass


func play_area_ambience(ambience_track: AmbienceTracks) -> void:
	
	match ambience_track:
		AmbienceTracks.FOREST:
			play_forest_sfx()
		
		AmbienceTracks.HOUSES:
			play_houses_sfx()


func play_forest_sfx() -> void:
	bird_chirp_very_far_should_play = true
	dog_bark1_should_play = true
	dog_bark2_should_play = true
	dog_bark3_should_play = true
	owl_hooting_should_play = true
	crickets_short_should_play = true
	
	var audio_fade_tween = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC).set_parallel()
	audio_fade_tween.tween_property(black_hole, "volume_db", black_hole_target_volume_db, fading_time)
	audio_fade_tween.tween_property(ghost_voice, "volume_db", ghost_voice_target_volume_db, fading_time)
	audio_fade_tween.tween_property(parker_probe1, "volume_db", min_stream_volume_db, fading_time)
	audio_fade_tween.tween_property(parker_probe2, "volume_db", min_stream_volume_db, fading_time)
	audio_fade_tween.tween_property(parker_probe_langmuir, "volume_db", min_stream_volume_db, fading_time)
	audio_fade_tween.tween_property(phase_sweeper, "volume_db", min_stream_volume_db, fading_time)
	audio_fade_tween.tween_property(saturn_radio, "volume_db", min_stream_volume_db, fading_time)
	audio_fade_tween.tween_property(sun_sonification, "volume_db", min_stream_volume_db, fading_time)
	audio_fade_tween.tween_property(voyager_plasma, "volume_db", voyager_plasma_target_volume_db, fading_time)
	
	audio_fade_tween.tween_property(crickets_long, "volume_db", min_stream_volume_db, fading_time)
	audio_fade_tween.tween_property(soft_wind1, "volume_db", min_stream_volume_db, fading_time)
	audio_fade_tween.tween_property(soft_wind2, "volume_db", min_stream_volume_db, fading_time)


func play_houses_sfx() -> void:
	bird_chirp_very_far_should_play = true
	dog_bark1_should_play = false
	dog_bark2_should_play = true
	dog_bark3_should_play = true
	owl_hooting_should_play = false
	crickets_short_should_play = true
	
	var audio_fade_tween = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC).set_parallel()
	audio_fade_tween.tween_property(black_hole, "volume_db", min_stream_volume_db, fading_time)
	audio_fade_tween.tween_property(ghost_voice, "volume_db", min_stream_volume_db, fading_time)
	audio_fade_tween.tween_property(parker_probe1, "volume_db", min_stream_volume_db, fading_time)
	audio_fade_tween.tween_property(parker_probe2, "volume_db", min_stream_volume_db, fading_time)
	audio_fade_tween.tween_property(parker_probe_langmuir, "volume_db", min_stream_volume_db, fading_time)
	audio_fade_tween.tween_property(phase_sweeper, "volume_db", min_stream_volume_db, fading_time)
	audio_fade_tween.tween_property(saturn_radio, "volume_db", min_stream_volume_db, fading_time)
	audio_fade_tween.tween_property(sun_sonification, "volume_db", min_stream_volume_db, fading_time)
	audio_fade_tween.tween_property(voyager_plasma, "volume_db", min_stream_volume_db, fading_time)
	
	audio_fade_tween.tween_property(crickets_long, "volume_db", crickets_long_target_volume_db, fading_time)
	audio_fade_tween.tween_property(soft_wind1, "volume_db", soft_wind1_target_volume_db, fading_time)
	audio_fade_tween.tween_property(soft_wind2, "volume_db", soft_wind2_target_volume_db, fading_time)
