extends Area2D

const DRAGGABLE_TRASH = preload("uid://d1yde7lsrkd5d")

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
