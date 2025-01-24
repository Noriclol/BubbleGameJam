extends Node3D
class_name PlayerMovement

@export var move_force : float = 10
@export var jump_force : float = 50
var shape_cast: ShapeCast3D

var output_delta : float

var jump_counter : int = 0

func _ready():
	shape_cast = $ShapeCast3D
	pass

func _process(delta):
	pass

func _physics_process(delta):
	# Shapecast3d ground check
	if (shape_cast.is_colliding()):
		var collider = shape_cast.get_collider(1)
		if collider and collider.is_in_group("ground"):
			print("Grounded")
			jump_counter = 0
	
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
		if jump_counter < 1:
			jump_counter += 1
			Global.player.apply_impulse(Vector3.UP * jump_force)


#func move_forward():
	#linear_velocity.x = speed
#
#func move_backward():
	#linear_velocity.x = -speed
