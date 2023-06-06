extends CanvasLayer

func atualizar_vida(valor):
	#$Control/HealthPoints.value = valor
	
	$Control/HealtPointsList.clear()
	for i in range(valor/2):
		$Control/HealtPointsList.add_icon_item(load("res://Assets/Props/Transperent/heart.png"), false)
