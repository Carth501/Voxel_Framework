class_name rand_offset_mesh extends MeshInstance3D

var rng = RandomNumberGenerator.new()

func scramble_offset():
	var material = mesh.surface_get_material(0)
	var offset = Vector3(rng.randf(), rng.randf(), 0)
	material.uv1_offset = offset
