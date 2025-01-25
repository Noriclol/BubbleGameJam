extends Area3D

class_name Hurt

signal hitbox_detected(hit: Hit)

func _init() -> void:
	monitoring = true
	monitorable = false
	collision_mask = 64 ## Hitboxes layer
	

func _ready():
	area_entered.connect(on_area_entered)


func on_area_entered(hit: Hit) -> void:
	hitbox_detected.emit(hit)
