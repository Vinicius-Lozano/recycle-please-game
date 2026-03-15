extends Node

signal  trash_collected
signal  point_added
# tipos de lixo
var type = [
	{'name': 'paper', 'sprite': 0, 'quantity': 0},
	{'name': 'glass', 'sprite': 1, 'quantity': 0},
	{'name': 'plastic', 'sprite': 2, 'quantity': 0},
	{'name': 'metal', 'sprite': 3, 'quantity': 0}
]
var points = 0

func add_trash(trash_name: String):
	for item in type:
		if item['name'] == trash_name:
			item['quantity'] += 1
			trash_collected.emit()
			break

func add_point():
	points += 1
	point_added.emit()
	print(points)
