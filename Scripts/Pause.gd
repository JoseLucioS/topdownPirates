extends Control



func _on_Continuar_pressed():
	get_tree().call_group("Mobile", "descongelar")
	$Popup.hide()

func _on_Salvar_pressed():
	SaveGame.salvar_jogo()


func _on_Carregar_pressed():
	SaveGame.carregar_jogo()


func _on_Retornar_pressed():
	get_tree().change_scene("res://GUI/Titulo.tscn")
