extends Control

export var jogador : NodePath
export var zoom : float

onready var mapa = $NinePatchRect
onready var icone_jogador = $NinePatchRect/Jogador
onready var icone_inimigo = $NinePatchRect/Inimigo
onready var icones = {"inimigo": icone_inimigo}

var escala_mapa
var marcadores = {}

func _ready():
	icone_jogador.position = mapa.get_rect().size / 2
	escala_mapa = mapa.get_rect().size / get_viewport_rect().size * zoom
	
	var objetos = get_tree().get_nodes_in_group("Minimapa")
	
	for i in objetos:
		i.connect("remover_marcador", self, "remover_marcador")
		var novo_marcador = icones[i.marcador_mapa].duplicate()
		mapa.add_child(novo_marcador)
		novo_marcador.show()
		marcadores[i] = novo_marcador

func _process(delta):
	if jogador:
		for i in marcadores:
			var posicao = (i.position -  get_node(jogador).position) * escala_mapa + mapa.get_rect().size / 2
			
			if mapa.get_rect().has_point(posicao + mapa.rect_position):
				marcadores[i].show()
			else:
				marcadores[i].hide()
			
			posicao.x = clamp(posicao.x, 0, mapa.get_rect().size.x)
			posicao.y = clamp(posicao.y, 0, mapa.get_rect().size.y)
			
			marcadores[i].position = posicao

func remover_marcador(objeto):
	if objeto in marcadores:
		marcadores[objeto].queue_free()
		marcadores.erase(objeto)
