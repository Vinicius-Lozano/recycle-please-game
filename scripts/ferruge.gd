extends CharacterBody2D

@export var speed: float = 20.0
@export var player: CharacterBody2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if player:
		var player_pos = player.global_position
		velocity.x = global_position.direction_to(player_pos).x * speed
	move_and_slide()
	
	if velocity > Vector2.ZERO:
		sprite.animation = 'walk'
	else:
		sprite.animation = 'default'


func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	if body == player:
		body.queue_free()
