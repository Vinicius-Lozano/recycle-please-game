extends Area2D

var selected = false
var mouse_offset = Vector2(0, 0)

var drag_type: String
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _process(_delta: float) -> void:
	if selected:
		followMouse()

func followMouse():
	position = get_global_mouse_position() + mouse_offset

func set_trash_type(data: Dictionary):
	drag_type = data['name']
	sprite.frame = data['sprite']

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			if GameManager.IS_DRAGGING == null:
				mouse_offset = position - get_global_mouse_position()
				selected = true
				GameManager.IS_DRAGGING = self
		else:
			if selected:
				selected = false
				GameManager.IS_DRAGGING = null
