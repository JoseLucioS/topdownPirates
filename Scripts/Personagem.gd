extends KinematicBody2D

export var velocidade : int
export var HP : int
export var dano : int
export var knockback : int

var direcao = Vector2(0, 0)
var frente

func _physics_process(delta):
	definir_movimento()
	definir_animacao()
	move_and_slide(direcao * velocidade)

func definir_movimento():
	pass

func definir_animacao():
	pass

func definir_direcao():
	if direcao.x > 0 and abs(direcao.x) > abs(direcao.y):
		frente = "_direita"
	elif direcao.x < 0 and abs(direcao.x) > abs(direcao.y):
		frente = "_esquerda"
	elif direcao.y > 0 and abs(direcao.x) < abs(direcao.y):
		frente = "_baixo"
	elif direcao.y < 0 and abs(direcao.x) < abs(direcao.y):
		frente = "_cima"
