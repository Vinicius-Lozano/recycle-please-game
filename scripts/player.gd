extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -300.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var initial_pos: Vector2

func _ready() -> void:
	initial_pos = global_position

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if GameManager.player_move_block:
		velocity = Vector2.ZERO
		move_and_slide()
		return

	var direction := Input.get_axis("move_left", "move_right")
	
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	if direction == 0:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("run")
	
	if not is_on_floor():
		animated_sprite.play("jump")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	handle_death()
	move_and_slide()

func handle_death() -> void:
	if global_position.y > 1000:
		print('fall')
		global_position = initial_pos
