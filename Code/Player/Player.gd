extends RigidBody3D
class_name Player

@export var path_follow : PathFollow3D
@onready var ground_check: ShapeCast3D = %GroundCheck
@onready var wall_check_left: RayCast3D = %WallCheck_Left
@onready var wall_check_right: RayCast3D = %WallCheck_Right

signal jumped_on_trail(trail : Trail)

func _init() -> void:
	Global.player = self
	
	
func _physics_process(delta: float) -> void:
	global_position.x = path_follow.global_position.x
	global_position.z = path_follow.global_position.z
	rotation = path_follow.rotation
