extends HBoxContainer

@onready var paper_label: Label = $PaperGroup/Qtd
@onready var glass_label: Label = $GlassGroup/Qtd
@onready var plastic_label: Label = $PlastGroup/Qtd
@onready var metal_label: Label = $MetalGroup/Qtd

func _ready() -> void:
	GameManager.trash_collected.connect(_on_trash_updated)
	update_display()

func _on_trash_updated() -> void:
	update_display()

func update_display() -> void:
	paper_label.text = str(GameManager.type[0]['quantity'])
	glass_label.text = str(GameManager.type[1]['quantity'])
	plastic_label.text = str(GameManager.type[2]['quantity'])
	metal_label.text = str(GameManager.type[3]['quantity'])
