extends "res://Scripts/Coletavel.gd"

export var dano = 5

func atualizar_dados(body):
	body.dano = dano
	body.espada = true
