extends "res://Scripts/Personagem.gd"

var espada = false

func definir_movimento():
	direcao.x = Input.get_axis("esquerda", "direita")
	direcao.y = Input.get_axis("cima", "baixo")
	
	definir_direcao()

func definir_animacao():
	if direcao.x == 0 and direcao.y == 0:
		#$AnimatedSprite.play("idle")
		$AnimatedSprite.stop()
	else:
		if espada:
			$AnimatedSprite.play("espada" + frente)
		else:
			$AnimatedSprite.play("andar" + frente)
