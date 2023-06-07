extends "res://Scripts/Coletavel.gd"

export var valor_cura = 4

func atualizar_dados(body):
	if (body.HP + valor_cura) <= body.HP_Max:
		body.HP += valor_cura
	else:
		body.HP = body.HP_Max
