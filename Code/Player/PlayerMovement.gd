extends Node3D
class_name PlayerMovement

@export var move_force : float = 10
@export var dampening : float = 0.05
@export var jump_force : float = 250

@export var velocity_limit : Vector3 = Vector3(1,2,1)

enum last_dir{
	LEFT,RIGHT,NONE
}

var last_direction : last_dir = last_dir.NONE
var jump_counter : int = 0

var input_movement : int
var on_trail : bool

var velocity : Vector3


func _process(delta):
	process_input()
	if Global.player.is_colliding_with_ground():
		on_trail = true
		UI.on_rail_label.text = "ON_TRAIL: TRUE"
		UI.on_rail_label.modulate = Color.WEB_GREEN
	else:
		on_trail = false
		UI.on_rail_label.text = "ON_TRAIL: FALSE"
		UI.on_rail_label.modulate = Color.DARK_RED


func _physics_process(delta):
	var move_output = handle_movement_force(delta)
	handle_physics(delta)
	if on_trail:	
		apply_velocity_to_pathfollow()
		slave_rigidbody_to_follow()
		#follow a pathfollow3d
		pass
	else:
		Global.player.linear_velocity = velocity
		#use its own rigidbody



# Physics Rigidmody movement
func handle_movement_force(delta : float) -> Vector3:
	var directional_force = input_movement * move_force * delta * Global.player.basis.z
	return directional_force
	

func handle_physics(delta:float):
	var move_output = handle_movement_force(delta)
	UI.input.text = "Input: " + str(input_movement)
	UI.velocity.text =  "Velocity: " + str(velocity)
	#apply dampening
	var damp_modifier = 1 - dampening
	
	if move_output != Vector3.ZERO:
		#apply acceleration
		var linear_velocity_modified : Vector3 = Vector3(
		velocity.x + move_output.x, 
		velocity.y,
		velocity.z + move_output.z, 
		)
		velocity = linear_velocity_modified
	else:
		#apply damping
		velocity *= damp_modifier
		if velocity.length() <= 0.1:
			velocity = Vector3.ZERO
	
	# apply gravity
	if !Global.player.is_colliding_with_ground():
		velocity += Vector3.DOWN * 9.82 * delta
	else:
		velocity *= Vector3(1,0,1)

	# cap speed in axes
	
	velocity = Vector3(
		clampf(velocity.x, -velocity_limit.x , velocity_limit.x), # X
		clampf(velocity.y, -velocity_limit.y , velocity_limit.y), # Y
		clampf(velocity.z, -velocity_limit.z , velocity_limit.z)) # Z
	


# PathFollow3D Movement

func apply_velocity_to_pathfollow():
	if Global.player.path_follow:
		if velocity.x > 0:
			Global.player.path_follow.progress += clampf(Global.player.basis.x.length() * velocity.length(), -velocity_limit.z, velocity_limit.z)
		elif velocity.x < 0:
			Global.player.path_follow.progress -= clampf(Global.player.basis.x.length() * velocity.length(), -velocity_limit.z, velocity_limit.z)


func slave_rigidbody_to_follow():
		Global.player.global_position.x = Global.player.path_follow.global_position.x
		Global.player.global_position.z = Global.player.path_follow.global_position.z
		Global.player.rotation = Global.player.path_follow.rotation

	


	
func process_input():
	
	if Input.is_action_pressed("Move Left") and Global.player:
		print("Player Left")
		input_movement = 1
		last_direction = last_dir.LEFT
		
	elif Input.is_action_pressed("Move Right") and Global.player:
		print("Player Right")
		input_movement = -1
		last_direction = last_dir.RIGHT
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
