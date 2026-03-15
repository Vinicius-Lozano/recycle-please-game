extends Button

@onready var trashbin: Area2D = $"../trashbin"

func _physics_process(delta: float) -> void:
	var trash_on_game = trashbin.get_child_count()
	if trash_on_game <= 1:
		visible = true
		disabled = false
	else:
		visible = false
		disabled = true
	
func _pressed() -> void:
	Fade.change_scene("res://scenes/menu.tscn")
