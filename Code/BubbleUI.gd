extends PanelContainer

class_name BubbleUI

@onready var bubble_label : Label = %BubbleLabel

func _ready():
	update_bubble_ui(Global.player.bubbles)

func update_bubble_ui(current_bubbles: int):
	bubble_label.text = ": " + str(current_bubbles)
	
