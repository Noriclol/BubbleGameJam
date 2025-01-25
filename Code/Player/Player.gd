extends RigidBody3D
class_name Player

@export var path_follow : PathFollow3D
@onready var ground_check: ShapeCast3D = %GroundCheck
@onready var wall_check_left: RayCast3D = %WallCheck_Left
@onready var wall_check_right: RayCast3D = %WallCheck_Right

signal jumped_on_trail(trail : Trail)

func _init() -> void:
	Global.player = self
	
func _ready() -> void:
	jumped_on_trail.connect(on_jumped_on_trail)
	

func _physics_process(delta: float) -> void:
	if path_follow:
		global_position.x = path_follow.global_position.x
		global_position.z = path_follow.global_position.z
		rotation = path_follow.rotation
		
	
	if (Global.player.ground_check.is_colliding()):
		var collider =  Global.player.ground_check.get_collider(0)
		if collider and collider.is_in_group("ground"):
			print("collided with collider")
			var csg_polygon = collider as CSGPolygon3D
			var path_node = csg_polygon.path_node as Path3D
			var path_follower = path_node.get_child(0) as PathFollow3D

			if path_follower is PathFollow3D:
				print ("It's a path follow")
			else: 
				print ("It's not a path follow")

			path_follow = path_follower
			#jumped_on_trail.emit(trail)
			#pass
			
func on_jumped_on_trail(trail:Trail):
	print("Jumped on trail "+ trail.name)
