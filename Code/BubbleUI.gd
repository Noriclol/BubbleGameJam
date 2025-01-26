extends PanelContainer

class_name BubbleUI

@onready var bubble_label : Label = %BubbleLabel

func update_bubble_ui(current_bubbles: int):
	bubble_label.text = ": " + str(current_bubbles)
	
