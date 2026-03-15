extends Label

func _ready():
	GameManager.point_added.connect(_on_points_updated)
	update_display()

func _on_points_updated():
	update_display()

func update_display():
	text = 'Pontos: %d' % [GameManager.points]
