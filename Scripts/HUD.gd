extends CanvasLayer

func atualizar_dados(vida, pocoes):
	atualizar_vida(vida)
	atualizar_pocoes(pocoes)

func atualizar_pocoes(valor):
	$Control/ItemList.set_item_text(0, "x " + str(valor))

func atualizar_vida(vida):
	$Control/HealtPointsList.clear()
	for i in range(vida/2):
		$Control/HealtPointsList.add_icon_item(load("res://Assets/Props/Transperent/heart.png"), false)
