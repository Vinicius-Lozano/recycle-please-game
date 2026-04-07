extends Area2D

@onready var label: Label = $Label
@onready var canvas_layer: CanvasLayer = $CanvasLayer

func _on_body_entered(_body: CharacterBody2D) -> void:
	label.visible = true

func _on_body_exited(_body: CharacterBody2D) -> void:
	label.visible = false
	canvas_layer.visible = false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		canvas_layer.visible = true
