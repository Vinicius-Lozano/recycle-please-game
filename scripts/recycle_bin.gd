@tool
extends Area2D

@export_enum('paper', 'glass', 'plastic', 'metal') var bin_type_choice: String = 'paper':
	set(value):
		bin_type_choice = value
		_update_bin_visuals()
@onready var sprite_bin: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	_update_bin_visuals()

func _update_bin_visuals():
	if not is_inside_tree() or sprite_bin == null:
		return
	
	var frames = {'paper': 0, 'glass': 1, 'plastic': 2, 'metal': 3}
	if bin_type_choice in frames:
		sprite_bin.frame = frames[bin_type_choice]

func _on_area_entered(area: Area2D) -> void:
	if 'drag_type' in area:
		if area.drag_type == bin_type_choice:
			GameManager.add_point()
			area.queue_free()
