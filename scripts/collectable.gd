extends Area2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
var trash_type: Dictionary

# escolhe o tipo quando dar spawn
func _ready() -> void:
	trash_type = GameManager.type[randi_range(0,3)]
	sprite.frame = trash_type['sprite']
	
	#colorir o sprite
	var item_color: Color = trash_type['color']
	var soft_color: Color = Color.WHITE.lerp(item_color, 0.4)
	sprite.modulate = soft_color

func _on_body_entered(_body: Node2D) -> void:
	GameManager.add_trash(trash_type['name'])
	queue_free()
	
