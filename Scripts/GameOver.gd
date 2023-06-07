extends Control

onready var animatedSprite = $CenterContainer/VBoxContainer/CenterContainer/HBoxContainer/AnimatedSprite

func _on_Continuar_pressed():
	get_tree().change_scene("res://Niveis/Fase01.tscn")


func _on_Sair_pressed():
	animatedSprite.play("morte")


func _on_AnimatedSprite_animation_finished():
	get_tree().quit()
