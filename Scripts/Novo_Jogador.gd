extends "res://Scripts/Personagem.gd"

export var HP_Max : int
var arma = false
var pocao = 0
var ouro = 0
var inventario = []

func _ready():
	velocidade = vel_normal

func _process(delta):
	atualizar_hud()

func atualizar_hud():
	get_tree().call_group("HUD", "atualizar_dados", HP, pocao, ouro)

func _input(event):
	if Input.is_action_just_pressed("ataque") and arma:
		$AnimationPlayer.play("ataque" + frente)
		set_physics_process(false)
	elif Input.is_action_just_pressed("item") and pocao > 0:
		HP += 4
		
		if HP > HP_Max:
			HP = HP_Max
		
		pocao -= 1

func definir_movimento():
	direcao.x = Input.get_axis("esquerda", "direita")
	direcao.y = Input.get_axis("cima", "baixo")
	
	definir_direcao()

func receber_item(item):
	if item.usavel:
		#inventario.append(item)
		if item.nome == "pocaoHP":
			pocao += 1
		pass
	else:
		dano = item.atributo
		arma = item
	pass

func definir_animacao():
	if direcao.x == 0 and direcao.y == 0:
		#$AnimatedSprite.play("idle")
		$AnimatedSprite.stop()
	else:
		if arma:
			$AnimatedSprite.play("espada" + frente)
		else:
			$AnimatedSprite.play("andar" + frente)

func morrer():
	get_tree().change_scene("res://GUI/GameOver.tscn")

func _on_AtaqueArea_body_entered(body):
	if body.collision_layer == 8: # 8 é o valor numerico da camada dos inimigos
		body.recebeu_ataque(dano, frente)


func _on_AnimationPlayer_animation_finished(anim_name):
	set_physics_process(true)
