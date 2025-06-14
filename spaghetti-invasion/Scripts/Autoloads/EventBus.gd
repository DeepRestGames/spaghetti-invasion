extends Node


# Add signals here to be triggered from any script

# Screen management
@warning_ignore("unused_signal")
signal splash_screen_end

@warning_ignore("unused_signal")
signal go_to_main_menu


# Game options
@warning_ignore("unused_signal")
signal gamma_value_changed(new_value)

@warning_ignore("unused_signal")
signal fov_value_changed(new_value)

@warning_ignore("unused_signal")
signal sfx_volume_value_changed(new_value)

@warning_ignore("unused_signal")
signal music_volume_value_changed(new_value)


# Input management
@warning_ignore("unused_signal")
signal focus_on_diary(focus)


# Interaction system
@warning_ignore("unused_signal")
signal looking_at_interactable(is_looking)


# Diary entries
@warning_ignore("unused_signal")
signal clue_interacted(clue_data)

@warning_ignore("unused_signal")
signal new_area_discovered(area_name)


# Audio events
@warning_ignore("unused_signal")
signal play_music(music_track: AudioManager.MusicTracks)

@warning_ignore("unused_signal")
signal play_area_ambience(area: AudioManager.AmbienceTracks)

@warning_ignore("unused_signal")
signal buildup


# Hints
@warning_ignore("unused_signal")
signal show_open_diary_hint
