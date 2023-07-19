extends Control

onready var SFXSlider = $ColorRect/MarginContainer/VBoxContainer/GridContainer/SFXSlider
onready var MusicaSlider = $ColorRect/MarginContainer/VBoxContainer/GridContainer/MusicaSlider

func _ready():
	SFXSlider.value = Config.pegar_volume("SFX")
	MusicaSlider.value = Config.pegar_volume("Musica")

func _on_SFXSlider_value_changed(value):
	Config.setar_volume("SFX", value)

func _on_MusicaSlider_value_changed(value):
	Config.setar_volume("Musica", value)

func _on_Button_pressed():
	Config.config.save(Config.CONFIG_PATH)
	get_tree().change_scene("res://GUI/Titulo.tscn")
