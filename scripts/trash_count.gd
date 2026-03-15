extends Label

func _ready():
	GameManager.trash_collected.connect(_on_trash_updated)
	update_display()

func _on_trash_updated():
	update_display()

func update_display():
	text = 'Papel: %d Vidro: %d Plastico: %d Metal: %d' %[
		GameManager.type[0]['quantity'],
		GameManager.type[1]['quantity'],
		GameManager.type[2]['quantity'],
		GameManager.type[3]['quantity'],
	]
