extends RigidBody3D

@export var projectile_speed : float = 10
@export var max_distance : float = 100
var distance : float = 0
var direction : int

func _init():
	pass
	#if shoot_direction == Enum.ShootDirection.LEFT:
	#	direction = -1
	#else:
	#	direction = 1
		

func _physics_process(delta):
	pass
	#var movement = -global_transform.basis.z * direction * projectile_speed * delta
	#global_transform.origin += movement
	#distance += movement.length()

	#if distance > max_distance:
	#	queue_free()
	#	print("Projectile Destroyed")
