extends Button

# Essa variável vai aparecer no Inspector. 
# Arraste a sua cena do Menu Principal para lá!
@export var main_menu_scene: PackedScene

func _ready() -> void:
	# Conectamos o sinal 'pressed' do botão via código de forma segura
	pressed.connect(_on_button_pressed)

func _on_button_pressed() -> void:
	# 1. Primeiro, chamamos a função que criamos para limpar os dados
	GameManager.reset_state()
	
	# 2. Depois, voltamos para o Menu Principal e reiniciamos a engine
	# Verificamos se você lembrou de colocar a cena no Inspector para evitar crashes
	if main_menu_scene != null:
		# Retoma o tempo normal caso o jogo estivesse pausado (time_scale = 0)
		Engine.time_scale = 1.0 
		get_tree().change_scene_to_packed(main_menu_scene)
	else:
		printerr("Atenção: A cena do Menu Principal não foi configurada no Inspector do botão!")
