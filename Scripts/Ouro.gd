extends Area2D

var valor

var ouro = [
	{
		"valor": 5,
		"imagem": "res://Assets/Props/Ouro/ouro5.png"
	},
	{
		"valor": 10,
		"imagem": "res://Assets/Props/Ouro/ouro10.png"
	},
	{
		"valor": 15,
		"imagem": "res://Assets/Props/Ouro/ouro15.png"
	},
	{
		"valor": 20,
		"imagem": "res://Assets/Props/Ouro/ouro20.png"
	},
	{
		"valor": 25,
		"imagem": "res://Assets/Props/Ouro/ouro25.png"
	},
	{
		"valor": 50,
		"imagem": "res://Assets/Props/Ouro/ouro50.png"
	},
	{
		"valor": 100,
		"imagem": "res://Assets/Props/Ouro/ouro100.png"
	},
	{
		"valor": 150,
		"imagem": "res://Assets/Props/Ouro/ouro150.png"
	}
]

func _ready():
	$AudioStreamPlayer.volume_db = Config.pegar_volume("SFX")
	randomize()
	var escolha = ouro[randi() % ouro.size()]
	valor = escolha.valor
	$Sprite.texture = load(escolha.imagem)


func _on_Ouro_body_entered(body):
	if body.collision_layer == 1:
		body.ouro += valor
		$Sprite.visible = false
		$AudioStreamPlayer.play()


func _on_AudioStreamPlayer_finished():
	queue_free()

func adicionar_loot(body):
	emit_signal("body_entered", body)
