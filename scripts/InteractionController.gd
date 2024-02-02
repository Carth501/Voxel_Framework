class_name interaction_controller extends Node3D

@export var ray: RayCast3D
var current_target
var active = true

func _physics_process(_delta):
	current_target = ray.get_collider()

func _input(event):
	if event.is_action_released("hit") && active:
		if current_target != null and current_target.has_method("break_block"):
			current_target.break_block()

func toggle_interaction(value: bool):
	active = value
