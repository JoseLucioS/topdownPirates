extends CanvasLayer

signal abrir_dialogo
signal avancar_dialogo
signal fechar_dialogo

var text_size = 0

const MAX_TEXT = 200

func _ready():
	connect("abrir_dialogo", self, "mostrar_caixa")
	connect("avancar_dialogo", self, "avancar_texto")
	connect("fechar_dialogo", self, "fechar_caixa")
	$Control/Dialogo/NinePatchRect/Continuar.visible = false

func atualizar_dados(vida, pocoes, ouro):
	atualizar_vida(vida)
	atualizar_pocoes(pocoes)
	atualizar_ouro(ouro)

func atualizar_vida(vida):
	$Control/HealtPointsList.clear()
	for i in range(vida/2):
		$Control/HealtPointsList.add_icon_item(load("res://Assets/Props/Transperent/heart.png"), false)

func atualizar_pocoes(valor):
	$Control/ItemList.set_item_text(0, "X" + str(valor))

func atualizar_ouro(valor):
	$Control/ItemList.set_item_text(1, "X" + str(valor))

func _input(event):
	if Input.is_action_just_pressed("interagir") and $Control/Dialogo.is_visible_in_tree():
		emit_signal("avancar_dialogo")

func mostrar_caixa(texto):
	get_tree().call_group("Mobile", "congelar")
	text_size = texto.length()
	$Control/Dialogo.popup()
	
	while(texto != ""):
		imprimir_texto(texto.substr(0, MAX_TEXT))
		texto = texto.substr(MAX_TEXT, -1)
		text_size = texto.length()
		yield(self, "avancar_dialogo")

func avancar_texto():
	if text_size == 0:
		emit_signal("fechar_dialogo")

func fechar_caixa():
	$Control/Dialogo/NinePatchRect/Texto.text = ""
	$Control/Dialogo.hide()
	get_tree().call_group("Mobile", "descongelar")

func imprimir_texto(texto):
	$Control/Dialogo/NinePatchRect/Texto.visible_characters = 0
	$Control/Dialogo/NinePatchRect/Texto.text = texto
	
	var animacao = create_tween()
	
	for i in range(texto.length()):
		animacao.tween_property($Control/Dialogo/NinePatchRect/Texto, "visible_characters", i, 0.03)
	
	animacao.tween_property($Control/Dialogo/NinePatchRect/Continuar, "visible", true, 0.01)

func pausar_jogo():
	get_tree().call_group("Mobile", "congelar")
	$Control/Pause/Popup.popup()
