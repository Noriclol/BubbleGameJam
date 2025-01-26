extends PanelContainer

@onready var parts : Array[TextureRect] = [$Part1, $Part2, $Part3, $Part4, $Part5, $Part6, $Part7]



func update_health_ui(current_health: int):
	if current_health == 7:
		parts[0].show()
		parts[1].show()
		parts[2].show()
		parts[3].show()
		parts[4].show()
		parts[5].show()
		parts[6].show()
		
	elif current_health <= 6:
		parts[6].hide()
	elif current_health <= 5:
		parts[5].hide()
	elif current_health <= 4:
		parts[4].hide()
	elif current_health <= 3:
		parts[3].hide()
	elif current_health <= 2:
		parts[2].hide()
	elif current_health <= 1:
		parts[1].hide()

	
