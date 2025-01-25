extends Area3D

class_name Hit

func _init() -> void:
	collision_mask = 0
	collision_layer = 64 ## Hitboxes layer
	monitoring = false
	monitorable = true


func enable():
	set_deferred("monitorable", true)
	

func disable():
	set_deferred("monitorable", false)
