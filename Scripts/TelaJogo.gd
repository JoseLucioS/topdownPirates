extends Control


func _ready():
	$Minimapa/Viewport.world_2d = $Principal/Viewport.world_2d

func _process(delta):
	$Minimapa/Viewport/Camera2D.position = $Principal/Viewport/Sandbox/Jogador.position
