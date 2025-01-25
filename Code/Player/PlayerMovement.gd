extends Node3D
class_name PlayerMovement

@export var move_force : float = 10
@export var jump_force : float = 50

@export var velocity_limit : Vector3 = Vector3(1,2,1)

var jump_counter : int = 0

var input_movement : int


func _process(delta):
	if !Global.player.health.dead:
		process_input()
		



func _physics_process(delta):
	if !Global.player.health.dead:
		Global.player.path_follow.progress += input_movement * move_force * delta
		Global.player.path_follow.progress_ratio = clampf(Global.player.path_follow.progress_ratio, 0.01, 0.99)
		slave_rigidbody_to_follow()
	#var move_output = handle_movement_force(delta)





# Physics Rigidmody movement
#func handle_movement_force(delta : float) -> Vector3:
	#var directional_force = input_movement * move_force * delta * Global.player.basis.z
	#return directional_force
	




# PathFollow3D Movement




func slave_rigidbody_to_follow():
		Global.player.global_position.x = Global.player.path_follow.global_position.x
		Global.player.global_position.z = Global.player.path_follow.global_position.z
		Global.player.rotation = Global.player.path_follow.rotation

	


	
func process_input():
	
	if Input.is_action_pressed("Move Left") and Global.player:
		print("Player Left")
		input_movement = - 1
		
	elif Input.is_action_pressed("Move Right") and Global.player:
		print("Player Right")
		input_movement = 1
	else:
		input_movement = 0
	
	
	# Shapecast3d ground check
	if Global.player.is_colliding_with_ground():
		jump_counter = 0
	else:
		Global
	

	if Input.is_action_just_pressed("Jump"):
		if jump_counter < 1:
			jump_counter += 1
			Global.player.apply_impulse(Vector3.UP * jump_force)
	
	if Input.is_action_just_pressed("Shoot"):
		var camera = get_viewport().get_camera_3d()
		var mouse_pos = get_viewport().get_mouse_position()

		# Get the ray origin and direction
		var ray_origin = camera.project_ray_origin(mouse_pos)
		var ray_direction = camera.project_ray_normal(mouse_pos)

		# Define a distance for the raycast (e.g., 1000 units forward)
		var ray_target = ray_origin + ray_direction * 1000

		#if mouse position z is bigger than player position, shoot right
		if ray_target.z > Global.player.global_position.z:
			print("Shoot Right")
			Global.player.shoot.shoot(Global.player.muzzle, Enum.ShootDirection.RIGHT)
		else:
			#shoot left
			print("Shoot Left")
			Global.player.shoot.shoot(Global.player.muzzle, Enum.ShootDirection.LEFT)
		
