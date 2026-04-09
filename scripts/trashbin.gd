extends Area2D

const DRAGGABLE_TRASH = preload("uid://d1yde7lsrkd5d")
@onready var master_button: Button = $"../CanvasLayer/reset"


func _physics_process(_delta: float) -> void:
	var trash_on_game = self.get_child_count()
	if trash_on_game <= 1:
		master_button.visible = true
		master_button.disabled = false
	else:
		master_button.visible = false
		master_button.disabled = true

func _ready() -> void:
	for item in	GameManager.type:
		if item['quantity'] > 0:
			for i in range(item['quantity']):
				
				var new_trash = DRAGGABLE_TRASH.instantiate()
				add_child(new_trash)
				
				new_trash.set_trash_type(item)
				new_trash.position = get_random_position()

func get_random_position() -> Vector2:
	var shape = $CollisionShape2D.shape
	var size = shape.size
	
	var x = randf_range(-size.x / 2, size.x /2)
	var y = randf_range(-size.y / 2, size.y /2)
	
	return Vector2(x, y)
