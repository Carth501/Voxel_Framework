shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	COLOR = vec4(.2, .5, 1, UV.g );
	
	// alternate:
	//float vert = (abs(UV.g - 0.5));
	//float hori = (abs(UV.r - 0.5));
	//COLOR = vec4(.2, .5, 1, pow(vert * hori, 0.5) );
}