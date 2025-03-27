class_name InteractableClue
extends StaticBody3D


@export var clue_data: ClueData


func interact():
	print("Clue activated!")
	
	if(clue_data == null):
		printerr("The interactable is missing a ClueData object!")
	else:
		print("Clue Data:")
		print(clue_data.clue_title)
		print(clue_data.clue_description)
		print(clue_data.clue_picture_path)
	
	EventBus.emit_signal("looking_at_interactable", false)
	collision_layer = 0
