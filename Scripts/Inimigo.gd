extends "res://Scripts/Personagem.gd"

#Estado do comportamento
# 0 - patrulha
# 1 - perseguição
var status
onready var player = get_node("/root").find_node("Jogador", true, false)

#variaveis para movimento
var destino
var opcoes

func definir_animacao():
	if direcao.x == 0 and direcao.y == 0:
		#$AnimatedSprite.play("idle")
		$AnimationPlayer.stop()
	else:
		$AnimationPlayer.play("andar" + frente)

func _on_Visao_body_entered(body):
	if body.collision_layer == 1:
		status = 1
		$NavigationAgent2D.set_target_location(body.position)
		set_physics_process(true)


func _on_Visao_body_exited(body):
	if body.collision_layer == 1:
		status = 0
		$NavigationAgent2D.set_target_location(body.position)


func _on_AtaqueArea_body_entered(body):
	if body.collision_layer == 1:
		set_physics_process(false)
		player = body
		$AnimationPlayer.play("ataque" + frente)

func atacar():
	player.recebeu_ataque(dano, frente)
	$Timer.start(1)

func pos_ataque():
	$NavigationAgent2D.set_target_location(player.position)
	status = 1
	set_physics_process(false)
	$Timer.start(1)

func gerar_loot():
	var ouro = preload("res://Mecanicas/Ouro.tscn")
	var loot = ouro.instance()
	var objetos = get_node("/root").find_node("Coletaveis", true, false)
	loot.position = position
	objetos.add_child(loot)
