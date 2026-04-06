extends Area2D

@onready var label: Label = $Label

func _on_body_entered(_body: CharacterBody2D) -> void:
	label.visible = true

func _on_body_exited(_body: CharacterBody2D) -> void:
	label.visible = false
