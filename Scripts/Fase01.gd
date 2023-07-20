extends Node2D

var texto_tutorial = "Movimento: A, W, S, D. Atacar: Espaco. Pausar o jogo: P. Usar pocao: Q. Interagir com as portas e Baus: E. Abrir inventario: I."
export var evento1 = true

func _ready():
	$Sons/Tema.volume_db = Config.pegar_volume("Musica")
	$Sons/AudioStreamPlayer2D.volume_db = Config.pegar_volume("SFX")
	$Sons/AudioStreamPlayer2D4.volume_db = Config.pegar_volume("SFX")
	$Sons/AudioStreamPlayer2D5.volume_db = Config.pegar_volume("SFX")
	if evento1:
		$HUD.emit_signal("abrir_dialogo", texto_tutorial)
		evento1 = false

func _on_Area2D_body_entered(body):
	if body.collision_layer == 1:
		tocar_cutscene_final(body)

func tocar_cutscene_final(body):
	$CenaFinal.position = body.position
	$CenaFinal.current = true
	body.visible = false
	
	var nova_posicao = $Objetivos/Navio.position
	nova_posicao.x += 600
	
	var animacao = create_tween()
	animacao.tween_property($Objetivos/Navio, "rotation_degrees", -90.0, 1)
	animacao.tween_property($Objetivos/Navio, "position", nova_posicao, 5)
	animacao.tween_callback(get_tree(), "change_scene", ["res://GUI/Titulo.tscn"])
