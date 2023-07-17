extends Node2D

var texto = "Essa eh uma aventura sobre piratas e fantasia dos sete mares em busca do one, do two e ate do three piece. Masmorras, ilhas e perigos nas profundezas do mar aguardam os corajosos marinheiros de agua doce que anseiam por conquistar a gloria eterna. Alem de lindas sereias, eh claro!"

func _ready():
	$HUD.emit_signal("abrir_dialogo", texto)
