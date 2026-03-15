extends Area2D

@export_file('*.tscn') var next_scene: String

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		Fade.change_scene(next_scene)
