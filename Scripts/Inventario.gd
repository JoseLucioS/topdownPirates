extends CanvasLayer

#onready var HUD = get_node("/root").find_node("HUD", true, false)
onready var jogador = get_node("/root").find_node("Jogador", true, false)

func _input(event):
	if Input.is_action_just_pressed("inventario"):
		preencher_dados()
		get_tree().call_group("Mobile", "congelar")
		$Popup.popup()

func preencher_dados():
	$Popup/Ouro.text = "Ouro: " + str(jogador.ouro)
	
	if jogador.arma:
		$Popup/Arma/Sprite.texture = load(jogador.arma.imagem)
	
	var objetos = $Popup/Itens.get_children()
	
	limpar_imagens(objetos)
	
	var contador = 0
	
	for i in jogador.inventario:
		var imagem = objetos[contador].get_children()
		imagem[0].texture = load(i.imagem)
		contador += 1

func limpar_imagens(item):
	for i in item:
		var imagem = i.get_children()
		imagem[0].texture = null

func _on_Fechar_pressed():
	$Popup.hide()
	get_tree().call_group("Mobile", "descongelar")
