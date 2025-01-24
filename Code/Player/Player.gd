extends RigidBody3D
class_name Player

@export var path_follow : PathFollow3D

func _init() -> void:
	Global.player = self
	
	
func _physics_process(delta: float) -> void:
	global_position.x = path_follow.global_position.x
	global_position.z = path_follow.global_position.z
	rotation = path_follow.rotation
