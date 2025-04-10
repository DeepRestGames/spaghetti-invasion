extends Node

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

@onready var lakeside = $SFX/Natural/Lakeside
@export var lakeside_target_volume_db = 5

@onready var river = $SFX/Natural/River
@export var river_target_volume_db = -30

@onready var cave_droplets_long = $SFX/Natural/CaveDropletsLong
@export var cave_droplets_long_target_volume_db = -10

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
#@export var crickets_short_volume_db = -15
@export var crickets_short_volume_db = -80
var crickets_short_should_play = false
var crickets_short_current_cooldown = 0
var crickets_short_panner_effect = AudioServer.get_bus_effect(8, 0)

@onready var cave_droplets_short = $SFX/Natural/CaveDropletsShort
@export var cave_droplets_short_play_chance = 0.1
@export var cave_droplets_short_play_cooldown = 5
@export var cave_droplets_short_volume_db = -10
var cave_droplets_short_should_play = false
var cave_droplets_short_current_cooldown = 0

@onready var forest_footsteps = $SFX/Natural/ForestFootsteps
@export var forest_footsteps_play_chance = 0.05
@export var forest_footsteps_play_cooldown = 5
@export var forest_footsteps_volume_db = -15
var forest_footsteps_should_play = false
var forest_footsteps_current_cooldown = 0
var forest_footsteps_panner_effect = AudioServer.get_bus_effect(10, 0)

@onready var twig_snap1 = $SFX/Natural/TwigSnap1
@export var twig_snap1_play_chance = 0.05
@export var twig_snap1_play_cooldown = 5
@export var twig_snap1_volume_db = -15
var twig_snap1_should_play = false
var twig_snap1_current_cooldown = 0
var twig_snap1_panner_effect = AudioServer.get_bus_effect(11, 0)

@onready var twig_snap2 = $SFX/Natural/TwigSnap2
@export var twig_snap2_play_chance = 0.05
@export var twig_snap2_play_cooldown = 5
@export var twig_snap2_volume_db = -15
var twig_snap2_should_play = false
var twig_snap2_current_cooldown = 0
var twig_snap2_panner_effect = AudioServer.get_bus_effect(12, 0)

@export_category("Children One Shot SFX")
@onready var laugh1 = $SFX/Children/Laugh1
@export var laugh1_play_chance = 0.005
@export var laugh1_play_cooldown = 5
@export var laugh1_volume_db = -25
var laugh1_should_play = false
var laugh1_current_cooldown = 0
var laugh1_panner_effect = AudioServer.get_bus_effect(13, 0)

@onready var laugh2 = $SFX/Children/Laugh2
@export var laugh2_play_chance = 0.005
@export var laugh2_play_cooldown = 5
@export var laugh2_volume_db = -25
var laugh2_should_play = false
var laugh2_current_cooldown = 0
var laugh2_panner_effect = AudioServer.get_bus_effect(14, 0)

@onready var laugh3 = $SFX/Children/Laugh3
@export var laugh3_play_chance = 0.005
@export var laugh3_play_cooldown = 5
@export var laugh3_volume_db = -25
var laugh3_should_play = false
var laugh3_current_cooldown = 0
var laugh3_panner_effect = AudioServer.get_bus_effect(15, 0)

@onready var laugh4 = $SFX/Children/Laugh4
@export var laugh4_play_chance = 0.005
@export var laugh4_play_cooldown = 5
@export var laugh4_volume_db = -25
var laugh4_should_play = false
var laugh4_current_cooldown = 0
var laugh4_panner_effect = AudioServer.get_bus_effect(16, 0)

@onready var playing1 = $SFX/Children/Playing1
@export var playing1_play_chance = 0.005
@export var playing1_play_cooldown = 5
@export var playing1_volume_db = -25
var playing1_should_play = false
var playing1_current_cooldown = 0
var playing1_panner_effect = AudioServer.get_bus_effect(17, 0)

@onready var playing2 = $SFX/Children/Playing2
@export var playing2_play_chance = 0.005
@export var playing2_play_cooldown = 5
@export var playing2_volume_db = -25
var playing2_should_play = false
var playing2_current_cooldown = 0
var playing2_panner_effect = AudioServer.get_bus_effect(18, 0)

@onready var playing3 = $SFX/Children/Playing3
@export var playing3_play_chance = 0.005
@export var playing3_play_cooldown = 5
@export var playing3_volume_db = -25
var playing3_should_play = false
var playing3_current_cooldown = 0
var playing3_panner_effect = AudioServer.get_bus_effect(19, 0)

# General variables
var min_stream_volume_db = -80.0
var fading_time = 5


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
	
	if(cave_droplets_short_should_play):
		cave_droplets_short_current_cooldown -= delta
		if(!cave_droplets_short.playing and cave_droplets_short_current_cooldown <= 0):
			if randf_range(0, 1) <= cave_droplets_short_play_chance:
				cave_droplets_short.pitch_scale = randf_range(.85, 1)
				cave_droplets_short.volume_db = cave_droplets_short_volume_db + randf_range(-5, 1)
				cave_droplets_short.play()
				cave_droplets_short_current_cooldown = cave_droplets_short_play_cooldown
	
	if(forest_footsteps_should_play):
		forest_footsteps_current_cooldown -= delta
		if(!forest_footsteps.playing and forest_footsteps_current_cooldown <= 0):
			if randf_range(0, 1) <= forest_footsteps_play_chance:
				forest_footsteps_panner_effect.pan = randf_range(-1, 1)
				forest_footsteps.pitch_scale = randf_range(.85, 1)
				forest_footsteps.volume_db = forest_footsteps_volume_db + randf_range(-5, 1)
				forest_footsteps.play()
				forest_footsteps_current_cooldown = forest_footsteps_play_cooldown
	
	if(twig_snap1_should_play):
		twig_snap1_current_cooldown -= delta
		if(!twig_snap1.playing and twig_snap1_current_cooldown <= 0):
			if randf_range(0, 1) <= twig_snap1_play_chance:
				twig_snap1_panner_effect.pan = randf_range(-1, 1)
				twig_snap1.volume_db = twig_snap1_volume_db + randf_range(-5, 1)
				twig_snap1.play()
				twig_snap1_current_cooldown = twig_snap1_play_cooldown
	
	if(twig_snap2_should_play):
		twig_snap2_current_cooldown -= delta
		if(!twig_snap2.playing and twig_snap2_current_cooldown <= 0):
			if randf_range(0, 1) <= twig_snap2_play_chance:
				twig_snap2_panner_effect.pan = randf_range(-1, 1)
				twig_snap2.volume_db = twig_snap2_volume_db + randf_range(-5, 1)
				twig_snap2.play()
				twig_snap2_current_cooldown = twig_snap2_play_cooldown
	
	if(laugh1_should_play):
		laugh1_current_cooldown -= delta
		if(!laugh1.playing and laugh1_current_cooldown <= 0):
			if randf_range(0, 1) <= laugh1_play_chance:
				laugh1_panner_effect.pan = randf_range(-1, 1)
				laugh1.pitch_scale = randf_range(.85, 1)
				laugh1.volume_db = laugh1_volume_db + randf_range(-5, 1)
				laugh1.play()
				laugh1_current_cooldown = laugh1_play_cooldown
	
	if(laugh2_should_play):
		laugh2_current_cooldown -= delta
		if(!laugh2.playing and laugh2_current_cooldown <= 0):
			if randf_range(0, 1) <= laugh2_play_chance:
				laugh2_panner_effect.pan = randf_range(-1, 1)
				laugh2.pitch_scale = randf_range(.85, 1)
				laugh2.volume_db = laugh2_volume_db + randf_range(-5, 1)
				laugh2.play()
				laugh2_current_cooldown = laugh2_play_cooldown
	
	if(laugh3_should_play):
		laugh3_current_cooldown -= delta
		if(!laugh3.playing and laugh3_current_cooldown <= 0):
			if randf_range(0, 1) <= laugh3_play_chance:
				laugh3_panner_effect.pan = randf_range(-1, 1)
				laugh3.pitch_scale = randf_range(.85, 1)
				laugh3.volume_db = laugh3_volume_db + randf_range(-5, 1)
				laugh3.play()
				laugh3_current_cooldown = laugh3_play_cooldown
	
	if(laugh4_should_play):
		laugh4_current_cooldown -= delta
		if(!laugh4.playing and laugh4_current_cooldown <= 0):
			if randf_range(0, 1) <= laugh4_play_chance:
				laugh4_panner_effect.pan = randf_range(-1, 1)
				laugh4.pitch_scale = randf_range(.85, 1)
				laugh4.volume_db = laugh4_volume_db + randf_range(-5, 1)
				laugh4.play()
				laugh4_current_cooldown = laugh4_play_cooldown
	
	if(playing1_should_play):
		playing1_current_cooldown -= delta
		if(!playing1.playing and playing1_current_cooldown <= 0):
			if randf_range(0, 1) <= playing1_play_chance:
				playing1_panner_effect.pan = randf_range(-1, 1)
				playing1.volume_db = playing1_volume_db + randf_range(-5, 1)
				playing1.play()
				playing1_current_cooldown = playing1_play_cooldown
	
	if(playing2_should_play):
		playing2_current_cooldown -= delta
		if(!playing2.playing and playing2_current_cooldown <= 0):
			if randf_range(0, 1) <= playing2_play_chance:
				playing2_panner_effect.pan = randf_range(-1, 1)
				playing2.volume_db = playing2_volume_db + randf_range(-5, 1)
				playing2.play()
				playing2_current_cooldown = playing2_play_cooldown
	
	if(playing3_should_play):
		playing3_current_cooldown -= delta
		if(!playing3.playing and playing3_current_cooldown <= 0):
			if randf_range(0, 1) <= playing3_play_chance:
				playing3_panner_effect.pan = randf_range(-1, 1)
				playing3.volume_db = playing3_volume_db + randf_range(-5, 1)
				playing3.play()
				playing3_current_cooldown = playing3_play_cooldown


enum MusicTracks {
	INTRO,
	INTRO_LOOP,
}


func play_music(music_track: MusicTracks) -> void:
	pass


enum AmbienceTracks {
	FOREST,
	ALIEN_FOREST,
	CLEARING,
	CAVE,
	LAKESIDE,
	RIVER
}


func play_area_ambience(ambience_track: AmbienceTracks) -> void:
	
	match ambience_track:
		AmbienceTracks.FOREST:
			play_forest_sfx()
		
		AmbienceTracks.ALIEN_FOREST:
			play_alien_forest_sfx()
		
		AmbienceTracks.CLEARING:
			play_clearing_sfx()
		
		AmbienceTracks.CAVE:
			play_cave_sfx()
		
		AmbienceTracks.LAKESIDE:
			play_lakeside_sfx()
		
		AmbienceTracks.RIVER:
			play_river_sfx()


func play_forest_sfx() -> void:
	bird_chirp_very_far_should_play = true
	dog_bark1_should_play = true
	dog_bark2_should_play = true
	dog_bark3_should_play = true
	owl_hooting_should_play = true
	crickets_short_should_play = true
	cave_droplets_short_should_play = false
	forest_footsteps_should_play = true
	twig_snap1_should_play = true
	twig_snap2_should_play = true
	laugh1_should_play = true
	laugh2_should_play = false
	laugh3_should_play = false
	laugh4_should_play = false
	playing1_should_play = true
	playing2_should_play = false
	playing3_should_play = false
	
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
	
	audio_fade_tween.tween_property(crickets_long, "volume_db", crickets_long_target_volume_db, fading_time)
	audio_fade_tween.tween_property(soft_wind1, "volume_db", min_stream_volume_db, fading_time)
	audio_fade_tween.tween_property(soft_wind2, "volume_db", min_stream_volume_db, fading_time)
	audio_fade_tween.tween_property(lakeside, "volume_db", min_stream_volume_db, fading_time)
	audio_fade_tween.tween_property(river, "volume_db", min_stream_volume_db, fading_time)
	audio_fade_tween.tween_property(cave_droplets_long, "volume_db", min_stream_volume_db, fading_time)


func play_alien_forest_sfx() -> void:
	bird_chirp_very_far_should_play = true
	dog_bark1_should_play = false
	dog_bark2_should_play = true
	dog_bark3_should_play = true
	owl_hooting_should_play = false
	crickets_short_should_play = true
	cave_droplets_short_should_play = false
	forest_footsteps_should_play = false
	twig_snap1_should_play = false
	twig_snap2_should_play = false
	laugh1_should_play = false
	laugh2_should_play = false
	laugh3_should_play = false
	laugh4_should_play = false
	playing1_should_play = false
	playing2_should_play = false
	playing3_should_play = false
	
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
	audio_fade_tween.tween_property(lakeside, "volume_db", min_stream_volume_db, fading_time)
	audio_fade_tween.tween_property(river, "volume_db", min_stream_volume_db, fading_time)
	audio_fade_tween.tween_property(cave_droplets_long, "volume_db", min_stream_volume_db, fading_time)


func play_clearing_sfx() -> void:
	bird_chirp_very_far_should_play = true
	dog_bark1_should_play = false
	dog_bark2_should_play = false
	dog_bark3_should_play = false
	owl_hooting_should_play = true
	crickets_short_should_play = true
	cave_droplets_short_should_play = false
	forest_footsteps_should_play = false
	twig_snap1_should_play = false
	twig_snap2_should_play = false
	laugh1_should_play = false
	laugh2_should_play = false
	laugh3_should_play = false
	laugh4_should_play = true
	playing1_should_play = false
	playing2_should_play = false
	playing3_should_play = false
	
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
	audio_fade_tween.tween_property(lakeside, "volume_db", min_stream_volume_db, fading_time)
	audio_fade_tween.tween_property(river, "volume_db", min_stream_volume_db, fading_time)
	audio_fade_tween.tween_property(cave_droplets_long, "volume_db", min_stream_volume_db, fading_time)


func play_cave_sfx() -> void:
	bird_chirp_very_far_should_play = false
	dog_bark1_should_play = false
	dog_bark2_should_play = false
	dog_bark3_should_play = false
	owl_hooting_should_play = false
	crickets_short_should_play = false
	cave_droplets_short_should_play = true
	forest_footsteps_should_play = false
	twig_snap1_should_play = false
	twig_snap2_should_play = false
	laugh1_should_play = true
	laugh2_should_play = true
	laugh3_should_play = true
	laugh4_should_play = true
	playing1_should_play = true
	playing2_should_play = true
	playing3_should_play = true
	
	var audio_fade_tween = get_tree().create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC).set_parallel()
	audio_fade_tween.tween_property(black_hole, "volume_db", min_stream_volume_db, fading_time)
	audio_fade_tween.tween_property(ghost_voice, "volume_db", ghost_voice_target_volume_db, fading_time)
	audio_fade_tween.tween_property(parker_probe1, "volume_db", min_stream_volume_db, fading_time)
	audio_fade_tween.tween_property(parker_probe2, "volume_db", min_stream_volume_db, fading_time)
	audio_fade_tween.tween_property(parker_probe_langmuir, "volume_db", min_stream_volume_db, fading_time)
	audio_fade_tween.tween_property(phase_sweeper, "volume_db", min_stream_volume_db, fading_time)
	audio_fade_tween.tween_property(saturn_radio, "volume_db", min_stream_volume_db, fading_time)
	audio_fade_tween.tween_property(sun_sonification, "volume_db", min_stream_volume_db, fading_time)
	audio_fade_tween.tween_property(voyager_plasma, "volume_db", voyager_plasma_target_volume_db, fading_time)
	
	audio_fade_tween.tween_property(crickets_long, "volume_db", min_stream_volume_db, fading_time)
	audio_fade_tween.tween_property(soft_wind1, "volume_db", soft_wind1_target_volume_db, fading_time)
	audio_fade_tween.tween_property(soft_wind2, "volume_db", soft_wind2_target_volume_db, fading_time)
	audio_fade_tween.tween_property(lakeside, "volume_db", min_stream_volume_db, fading_time)
	audio_fade_tween.tween_property(river, "volume_db", min_stream_volume_db, fading_time)
	audio_fade_tween.tween_property(cave_droplets_long, "volume_db", cave_droplets_long_target_volume_db, fading_time)


func play_lakeside_sfx() -> void:
	bird_chirp_very_far_should_play = true
	dog_bark1_should_play = false
	dog_bark2_should_play = false
	dog_bark3_should_play = false
	owl_hooting_should_play = false
	crickets_short_should_play = true
	cave_droplets_short_should_play = false
	forest_footsteps_should_play = false
	twig_snap1_should_play = false
	twig_snap2_should_play = false
	laugh1_should_play = false
	laugh2_should_play = false
	laugh3_should_play = false
	laugh4_should_play = false
	playing1_should_play = false
	playing2_should_play = false
	playing3_should_play = false
	
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
	audio_fade_tween.tween_property(lakeside, "volume_db", lakeside_target_volume_db, fading_time)
	audio_fade_tween.tween_property(river, "volume_db", min_stream_volume_db, fading_time)
	audio_fade_tween.tween_property(cave_droplets_long, "volume_db", min_stream_volume_db, fading_time)


func play_river_sfx() -> void:
	bird_chirp_very_far_should_play = true
	dog_bark1_should_play = false
	dog_bark2_should_play = false
	dog_bark3_should_play = false
	owl_hooting_should_play = false
	crickets_short_should_play = false
	cave_droplets_short_should_play = false
	forest_footsteps_should_play = false
	twig_snap1_should_play = false
	twig_snap2_should_play = false
	laugh1_should_play = false
	laugh2_should_play = true
	laugh3_should_play = false
	laugh4_should_play = false
	playing1_should_play = false
	playing2_should_play = false
	playing3_should_play = false
	
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
	
	audio_fade_tween.tween_property(crickets_long, "volume_db", min_stream_volume_db, fading_time)
	audio_fade_tween.tween_property(soft_wind1, "volume_db", soft_wind1_target_volume_db, fading_time)
	audio_fade_tween.tween_property(soft_wind2, "volume_db", soft_wind2_target_volume_db, fading_time)
	audio_fade_tween.tween_property(lakeside, "volume_db", min_stream_volume_db, fading_time)
	audio_fade_tween.tween_property(river, "volume_db", river_target_volume_db, fading_time)
	audio_fade_tween.tween_property(cave_droplets_long, "volume_db", min_stream_volume_db, fading_time)
