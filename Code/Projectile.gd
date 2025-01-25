extends RigidBody3D

@export var projectile_speed : float = 10
var distance : float = 0
var max_distance : float = 100

func _physics_process(delta):
	var movement = -global_transform.basis.z * projectile_speed * delta
	global_transform.origin += movement
	distance += movement.length()

	if distance > max_distance:
		queue_free()
		print("Projectile Destroyed")
