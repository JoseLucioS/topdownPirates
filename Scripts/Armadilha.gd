extends Area2D

export var dano : int
var jogador

func _on_Espinhos_body_entered(body):
	if body.collision_layer == 1:
		$AnimationPlayer.play("ativar")
		jogador = body

func atacar():
	var sentido = definir_lado(jogador.frente)
	jogador.recebeu_ataque(dano, sentido)


func definir_lado(frente):
	if frente == "_cima":
		return "_baixo"
	elif frente == "_baixo":
		return "_cima"
	elif frente == "_direita":
		return "_esquerda"
	elif frente == "_esquerda":
		return "_direita"
