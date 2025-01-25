extends Node3D
class_name PlayerMovement

@export var move_force : float = 10
@export var jump_force : float = 50
@export var dampening : float = 0.05
var jump_counter : int = 0

var input_movement : int

var on_trail : bool



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


func handle_movement_force(delta : float) -> float:
	var directional_force = input_movement * move_force * delta 
	return 0
	


func _physics_process(delta):
	var move_output = handle_movement_force(delta)
	if on_trail:
		if Global.player.path_follow:
			Global.player.path_follow.progress += move_output
			Global.player.global_position.x = Global.player.path_follow.global_position.x
			Global.player.global_position.z = Global.player.path_follow.global_position.z
			Global.player.rotation = Global.player.path_follow.rotation
		else:
			print("no valid path follow in player")
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
		pass
	
	
	

	
func process_input():
	if Input.is_action_pressed("Move Left") and Global.player:
		print("Player Left")
		input_movement = 1
	elif Input.is_action_pressed("Move Right") and Global.player:
		print("Player Right")
		input_movement = -1
	pass
	
	
	# Shapecast3d ground check
	if ( Global.player.ground_check.is_colliding()):
		var collider =  Global.player.ground_check.get_collider(1)
		if collider and collider.is_in_group("ground"):
			print("Grounded")
			jump_counter = 0
	
	## Calculate output Delta
	#if Input.is_action_pressed("Move Left") and Global.player:
		#print("Player Left")
		#output_delta = move_force
		##Global.player.apply_force(Vector3.FORWARD * move_force)
	#elif Input.is_action_pressed("Move Right") and Global.player:
		#print("Player Right")
		#output_delta = - move_force
		##Global.player.apply_force(Vector3.BACK * move_force)
	#else: 
		#output_delta = 0
		
	# Apply Output Delta
	#if output_delta != 0 and Global.player.path_follow:
		#Global.player.path_follow.progress  += output_delta * delta
	
	if Input.is_action_just_pressed("Jump"):
		if jump_counter < 1:
			jump_counter += 1
			Global.player.apply_impulse(Vector3.UP * jump_force)


#func move_forward():
	#linear_velocity.x = speed
#
#func move_backward():
	#linear_velocity.x = -speed
