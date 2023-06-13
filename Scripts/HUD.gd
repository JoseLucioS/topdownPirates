extends CanvasLayer

func atualizar_dados(vida, pocoes, ouro):
	atualizar_vida(vida)
	atualizar_pocoes(pocoes)
	atualizar_ouro(ouro)

func atualizar_vida(vida):
	$Control/HealtPointsList.clear()
	for i in range(vida/2):
		$Control/HealtPointsList.add_icon_item(load("res://Assets/Props/Transperent/heart.png"), false)

func atualizar_pocoes(valor):
	$Control/ItemList.set_item_text(0, "X" + str(valor))

func atualizar_ouro(valor):
	$Control/ItemList.set_item_text(1, "X" + str(valor))
