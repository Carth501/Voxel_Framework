class_name UserInterface extends Control

signal in_menu_mode(value : bool)
signal not_in_menu_mode(value : bool)

@export var entity_config : entity_configuration
@export var targetting_ray : RayCast3D
var menu_mode := false

func _ready():
	if(targetting_ray == null):
		push_warning("targetting_ray not found. Was this intentional?")

func _input(event):
	if event.is_action_pressed("select"):
		var target := targetting_ray.get_collider()
		if(target != null && target is generic_block):
			entity_config.open(target)
	if event.is_action_pressed("menu_mode"):
		toggle_menu_mode()

func toggle_menu_mode():
	menu_mode = !menu_mode
	if(menu_mode):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		entity_config.close()
	in_menu_mode.emit(menu_mode)
	not_in_menu_mode.emit(!menu_mode)
