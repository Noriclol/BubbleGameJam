extends Node
class_name Health


signal take_damage(damage:int)
signal die()

@export var max_health: int = 100
var current_health: int
var min_health: int = 0
var dead : bool = false
func _ready():
	current_health = max_health
	#hurt.connect("hitbox_detected", self, "apply_damage")

func apply_damage(damage: int) -> void:
	current_health -= damage
	take_damage.emit()
	if current_health < min_health:
		dead = true
		die.emit()
		
	
