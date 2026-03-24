extends Button

@export_file('*.tscn') var where: String

func _pressed() -> void:
	Fade.change_scene(where)
