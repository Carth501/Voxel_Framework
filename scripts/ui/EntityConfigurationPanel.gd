class_name entity_configuration extends Control

@export var config_panel : Panel
@export var block_name_label : Label
@export var x_spin_box : SpinBox
@export var y_spin_box : SpinBox
var current_target

func open(target: generic_block):
	disconnect_target()
	config_panel.visible = true
	current_target = target
	block_name_label.text = current_target.name
	if(current_target.has_method("get_mesh_vec")):
		var mesh_vec = current_target.get_mesh_vec()
		x_spin_box.value = mesh_vec.x * 100
		y_spin_box.value = mesh_vec.y * 100
	current_target.tree_exiting.connect(close)

func close():
	disconnect_target()
	current_target = null
	config_panel.visible = false

func disconnect_target():
	if(current_target != null):
		current_target.tree_exiting.disconnect(close)

func y_mesh_change(value: float):
	current_target.set_mesh_vec(Vector2(x_spin_box.value / 100.0, value / 100.0))

func x_mesh_change(value: float):
	current_target.set_mesh_vec(Vector2(value / 100.0, y_spin_box.value / 100.0))
