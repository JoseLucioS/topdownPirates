extends "res://Scripts/Personagem.gd"

#Estado do comportamento
# 0 - patrulha
# 1 - perseguição
var status

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
