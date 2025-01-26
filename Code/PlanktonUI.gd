extends PanelContainer

class_name PlanktonUI

@export var plankton_label : Label

func _ready():
	update_plankton_ui(Global.player.plankton)

func update_plankton_ui(current_plankton: int):
	plankton_label.text = ": " + str(current_plankton)
