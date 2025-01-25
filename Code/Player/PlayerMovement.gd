extends Node3D
class_name PlayerMovement

@export var move_force : float = 10
@export var dampening : float = 0.05

@export var jump_force : float = 50
var jump_counter : int = 0

var input_movement : int
var on_trail : bool

var velocity : Vector3


func _process(delta):
	process_input()
	if Global.player.is_colliding_with_ground():
		on_trail = true
		UI.on_rail_label.text = "ON_RAIL: TRUE"
		UI.on_rail_label.modulate = Color.WEB_GREEN
	else:
		on_trail = false
		UI.on_rail_label.text = "ON_RAIL: FALSE"
		UI.on_rail_label.modulate = Color.DARK_RED


func _physics_process(delta):
	var move_output = handle_movement_force(delta)
	if on_trail:	
		slave_rigidbody_to_follow()
		#follow a pathfollow3d
		pass
	else:
		var linear_velocity_modified : Vector3 = Vector3(
			Global.player.linear_velocity.x + move_output.x, 
			Global.player.linear_velocity.y,
			Global.player.linear_velocity.z + move_output.z, 
			)
		Global.player.linear_velocity = linear_velocity_modified
		#use its own rigidbody
		
		
		
		
		
		
# Physics Rigidmody movement
func handle_movement_force(delta : float) -> Vector3:
	var directional_force = input_movement * move_force * delta * Global.player.basis.z
	return directional_force
	

func handle_physics(delta:float) -> Vector2:
	var linear_velocity_output = velocity
	var move_output = handle_movement_force(delta)
	UI.input.text = input_movement
	UI.velocity.text = velocity
	#apply dampening
	var damp_modifier = 1 - dampening
	
	velocity *= damp_modifier
	
	if move_output == Vector3.ZERO:
		return linear_velocity_output
		
	# apply move output
	var linear_velocity_modified : Vector3 = Vector3(
		velocity.x + move_output.x, 
		velocity.y,
		velocity.z + move_output.z, 
		)
	linear_velocity_output = linear_velocity_modified
	return linear_velocity_output


# PathFollow3D Movement

func slave_rigidbody_to_follow():
	if Global.player.path_follow:
		Global.player.path_follow.progress += velocity.length()
		Global.player.global_position.x = Global.player.path_follow.global_position.x
		Global.player.global_position.z = Global.player.path_follow.global_position.z
		Global.player.rotation = Global.player.path_follow.rotation
	else:
		print("no valid path follow in player")
	


	
func process_input():
	
	if Input.is_action_pressed("Move Left") and Global.player:
		print("Player Left")
		input_movement = 1
	elif Input.is_action_pressed("Move Right") and Global.player:
		print("Player Right")
		input_movement = -1
	else:
		input_movement = 0
	
	
	# Shapecast3d ground check
	if Global.player.is_colliding_with_ground():
		jump_counter = 0
	

	if Input.is_action_just_pressed("Jump"):
		if jump_counter < 1:
			jump_counter += 1
			Global.player.apply_impulse(Vector3.UP * jump_force)
