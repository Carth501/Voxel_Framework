extends CharacterBody3D

# How fast the player moves in meters per second.
@export var speed = 4
# The downward acceleration when in the air, in meters per second squared.
@export var fall_acceleration = 10
@export var jump_strength = 2

var target_velocity = Vector3.ZERO

var MOUSE_SENSITIVITY = 0.05

@onready var camera = $Camera

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotate_y(deg_to_rad(event.relative.x * MOUSE_SENSITIVITY * -1))
		camera.rotate_x(deg_to_rad(event.relative.y * MOUSE_SENSITIVITY * -1))

		var camera_rot = camera.rotation_degrees
		camera_rot.x = clamp(camera_rot.x, -70, 70)
		camera.rotation_degrees = camera_rot

func _physics_process(delta):
	var direction = Vector3.ZERO

	if is_on_floor():
		if Input.is_action_pressed("move_right"):
			direction.x -= 1
		if Input.is_action_pressed("move_left"):
			direction.x += 1
		if Input.is_action_pressed("move_back"):
			direction.z += 1
		if Input.is_action_pressed("move_forward"):
			direction.z -= 1

	if direction != Vector3.ZERO:
		direction = direction.normalized() * camera.global_transform.basis * Vector3(-1, 1, 1)

	if is_on_floor():
		target_velocity.x = direction.x * speed
		target_velocity.z = direction.z * speed

		if Input.is_action_pressed("jump"):
			target_velocity.y = jump_strength

	if not is_on_floor():
		target_velocity.y -= (fall_acceleration * delta)

	velocity = target_velocity
	move_and_slide()
