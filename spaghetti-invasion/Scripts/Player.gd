class_name  Player
extends CharacterBody3D

# Movement variables
var speed
const WALK_SPEED = 5.0
const SPRINT_SPEED = 8.0

# Camera variables
@onready var head = $Head
@onready var camera = $Head/Camera3D
const SENSITIVITY = 0.001
var mouse_captured = false
# Head bob
const BOB_FREQUENCY = 1.8
const BOB_AMPLITUDE = 0.04
var t_bob = 0.0
# FOV
const BASE_FOV = 75.0
const FOV_CHANGE = 1.8

var process_inputs = true


func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	EventBus.connect("focus_on_diary", focus_on_diary)


func _unhandled_input(event: InputEvent) -> void:
	# Camera movement
	if event is InputEventMouseMotion and process_inputs:
		head.rotate_y(-event.relative.x * SENSITIVITY)
		camera.rotate_x(-event.relative.y * SENSITIVITY)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-60), deg_to_rad(80))


func _physics_process(delta):
	if !process_inputs:
		return
	
	# Sprint
	if Input.is_action_pressed("sprint") and is_on_floor():
		speed = SPRINT_SPEED
	else:
		speed = WALK_SPEED
	
	# Get the input direction and handle the movement/deceleration.
	var input_dir = Input.get_vector("left", "right", "forward", "backward")
	var direction = (head.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = lerp(velocity.x, direction.x * speed, delta * 7.0)
		velocity.z = lerp(velocity.z, direction.z * speed, delta * 7.0)


	# Head bob
	t_bob += delta * velocity.length() * float(is_on_floor())
	camera.transform.origin = _headbob(t_bob)
	
	# FOV
	var velocity_clamped = clamp(velocity.length(), WALK_SPEED, SPRINT_SPEED * 2)
	var target_fov = BASE_FOV + FOV_CHANGE * velocity_clamped
	camera.fov = lerp(camera.fov, target_fov, delta * 8.0)
	
	move_and_slide()


func _headbob(time) -> Vector3:
	var pos = Vector3.ZERO
	pos.y = sin(time * BOB_FREQUENCY) * BOB_AMPLITUDE
	pos.x = cos(time * BOB_FREQUENCY / 2) * BOB_AMPLITUDE
	return pos


func focus_on_diary(focus: bool) -> void:
	if focus:
		process_inputs = false
	else:
		process_inputs = true
