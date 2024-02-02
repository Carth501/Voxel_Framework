class_name generic_block extends StaticBody3D

@export var mesh_handler : rand_offset_mesh
@export var scramble := true

func _ready():
	if(scramble):
		mesh_handler.scramble_offset()

func get_mesh_vec() -> Vector2:
	var mesh_coords = mesh_handler.mesh.surface_get_material(0).uv1_offset
	return Vector2(mesh_coords.x, mesh_coords.y)

func set_mesh_vec(coords: Vector2):
	var coords_vec3 = Vector3(coords.x, coords.y, 0)
	mesh_handler.mesh.surface_get_material(0).uv1_offset = coords_vec3

func break_block():
	queue_free()
