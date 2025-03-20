extends Control


@onready var logos_container = $Logos

@export var initial_wait_time := 2.0
@export var fading_time := 3.0
@export var visible_time := 1.5
@export var offset_time := 2.0


func _ready() -> void:
	for logo in logos_container.get_children() as Array[Control]:
		logo.modulate.a = 0
	
	await create_tween().tween_interval(initial_wait_time).finished
	
	for i in logos_container.get_child_count():
		var current_logo = logos_container.get_child(i) as Control
		
		var fade_tween = create_tween().set_trans(Tween.TRANS_LINEAR)
		fade_tween.tween_property(current_logo, "modulate:a", 1, fading_time)
		fade_tween.tween_interval(visible_time)
		fade_tween.tween_property(current_logo, "modulate:a", 0, fading_time)
		await fade_tween.tween_interval(offset_time).finished

	EventBus.emit_signal("splash_screen_end")
