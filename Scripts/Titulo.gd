extends Control


func _ready():
	$AudioStreamPlayer.volume_db = Config.pegar_volume("Musica")
	$AnimationPlayer.play("tela_inicial")

func _on_Iniciar_pressed():
	get_tree().change_scene("res://Niveis/Fase01.tscn")


func _on_Sair_pressed():
	get_tree().quit()


func _on_Carregar_pressed():
	pass # Replace with function body.


func _on_Config_pressed():
	get_tree().change_scene("res://GUI/TelaConfiguracao.tscn")
