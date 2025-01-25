extends Node
class_name Health


signal take_damage(damage:int)
signal die()
signal health_changed(health:int)

@export var max_health: int = 100
var current_health: int
var min_health: int = 0
var dead : bool = false
func _ready():
	health_changed.emit(max_health)
	current_health = max_health
	#hurt.connect("hitbox_detected", self, "apply_damage")

func apply_damage(damage: int) -> void:
	current_health -= damage
	take_damage.emit(damage)
	health_changed.emit(current_health)
	if current_health <= min_health:
		print("healthmodule: Player Died")
		dead = true
		die.emit()
		
	
