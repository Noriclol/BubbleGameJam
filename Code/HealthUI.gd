extends HBoxContainer

@export var part_1 : TextureRect
@export var part_2 : TextureRect
@export var part_3 : TextureRect
@export var part_4 : TextureRect
@export var part_5 : TextureRect
@export var part_6 : TextureRect
@export var part_7 : TextureRect

@onready var health_part_1 = preload("res://Assets/SVGS/Shrimp health icon/Shrimp icon part 1.svg")
@onready var health_part_2 = preload("res://Assets/SVGS/Shrimp health icon/Shrimp icon part 2.svg")
@onready var health_part_3 = preload("res://Assets/SVGS/Shrimp health icon/Shrimp icon part 3.svg")
@onready var health_part_4 = preload("res://Assets/SVGS/Shrimp health icon/Shrimp icon part 4.svg")
@onready var health_part_5 = preload("res://Assets/SVGS/Shrimp health icon/Shrimp icon part 5.svg")
@onready var health_part_6 = preload("res://Assets/SVGS/Shrimp health icon/Shrimp icon part 6.svg")
@onready var health_part_7 = preload("res://Assets/SVGS/Shrimp health icon/Shrimp icon part 7.svg")

func _ready():
	part_1.texture = health_part_1
	part_2.texture = health_part_2
	part_3.texture = health_part_3
	part_4.texture = health_part_4
	part_5.texture = health_part_5
	part_6.texture = health_part_6
	part_7.texture = health_part_7

func update_health_ui(current_health: int):
	if current_health == 100:
		health_part_1.show()
		health_part_2.show()
		health_part_3.show()
		health_part_4.show()
		health_part_5.show()
		health_part_6.show()
		health_part_7.show()
	elif current_health <= 90:
		health_part_7.hide()
	elif current_health <= 80:
		health_part_6.hide()
	elif current_health <= 70:
		health_part_5.hide()
	elif current_health <= 60:
		health_part_4.hide()
	elif current_health <= 50:
		health_part_3.hide()
	elif current_health <= 40:
		health_part_2.hide()
	else:
		health_part_1.hide()
	
