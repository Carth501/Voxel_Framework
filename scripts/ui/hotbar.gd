class_name hotbar extends Control

@export var slots : Array[item]
var selected_index := 0
@export var hotbar_delay := 0.05
var next_hotbar_shift := 0.0

func _ready():
	slots[selected_index].toggle_highlighting(true)

func _input(event):
	if event.is_action("hotbar_increment"):
		if(next_hotbar_shift < Time.get_ticks_msec()):
			next_hotbar_shift = Time.get_ticks_msec() + hotbar_delay * 1000
			increment_index()
	elif event.is_action("hotbar_decrement"):
		if(next_hotbar_shift < Time.get_ticks_msec()):
			next_hotbar_shift = Time.get_ticks_msec() + hotbar_delay * 1000
			decrement_index()

func get_current_item() -> item:
	return slots[selected_index]

func increment_index():
	change_index(selected_index + 1)

func decrement_index():
	change_index(selected_index - 1)

func change_index(index: int):
	slots[selected_index].toggle_highlighting(false)
	if(index >= 0):
		selected_index = index % slots.size()
	else:
		selected_index = index + slots.size()
	slots[selected_index].toggle_highlighting(true)
