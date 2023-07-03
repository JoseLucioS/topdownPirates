extends "res://Scripts/Porta.gd"

export var id : int

func _on_Area2D_body_entered(body):
	if body.collision_layer == 1:
		for i in body.inventario:
			if i.nome == "chave" and i.atributo == id:
				pode_usar = true
