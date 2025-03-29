extends Node


# Add signals here to be triggered from any script

# Screen management
@warning_ignore("unused_signal")
signal splash_screen_end


# Game options
@warning_ignore("unused_signal")
signal gamma_value_changed(new_value)


# Input management
@warning_ignore("unused_signal")
signal focus_on_diary(focus)


# Interaction system
@warning_ignore("unused_signal")
signal looking_at_interactable(is_looking)

# Diary entries
@warning_ignore("unused_signal")
signal clue_interacted(clue_data)
