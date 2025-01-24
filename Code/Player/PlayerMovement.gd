extends Node3D
class_name PlayerMovement

@export var move_force : float = 10
@export var jump_force : float = 50
var output_delta : float

var jump_counter = 2

func _ready():
	
	pass

func _process(delta):
	pass

func _physics_process(delta):
	
	
	# Calculate output Delta
	if Input.is_action_pressed("Move Left") and Global.player:
		print("Player Left")
		output_delta = move_force
		#Global.player.apply_force(Vector3.FORWARD * move_force)
	elif Input.is_action_pressed("Move Right") and Global.player:
		print("Player Right")
		output_delta = - move_force
		#Global.player.apply_force(Vector3.BACK * move_force)
	else: 
		output_delta = 0
		
	# Apply Output Delta
	if output_delta != 0:
		Global.player.path_follow.progress  += output_delta * delta
	
	if Input.is_action_just_pressed("Jump"):
		Global.player.apply_impulse(Vector3.UP * jump_force)



#func move_forward():
	#linear_velocity.x = speed
#
#func move_backward():
	#linear_velocity.x = -speed
