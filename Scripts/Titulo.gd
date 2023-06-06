extends Control


func _ready():
	$AnimationPlayer.play("tela_inicial")

func _on_Iniciar_pressed():
	get_tree().change_scene("res://Niveis/Fase01.tscn")


func _on_Sair_pressed():
	get_tree().quit()
