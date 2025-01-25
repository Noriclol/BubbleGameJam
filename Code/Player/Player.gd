extends RigidBody3D
class_name Player

@export var path_follow : PathFollow3D = null
@onready var ground_check: ShapeCast3D = %GroundCheck
@onready var wall_check_left: RayCast3D = %WallCheck_Left
@onready var wall_check_right: RayCast3D = %WallCheck_Right

signal jumped_on_trail(trail : Trail)

func _init() -> void:
	Global.player = self
	pass
	
	
func _ready() -> void:
	jumped_on_trail.connect(on_jumped_on_trail)






func on_jumped_on_trail(trail:Trail):
	print("Jumped on trail "+ trail.name)


func is_colliding_with_ground() -> bool:
	if ( ground_check.is_colliding()):
		var collider =  ground_check.get_collider(1)
		if collider and collider.is_in_group("ground"):
			if !path_follow:
				tie_player_to_trail(collider)
			return true
	return false



func tie_player_to_trail(collider: Object):
	print("tying player to trail")
	var csg_polygon = collider as CSGPolygon3D
	var trail = Global.find_trail_belonging_to_mesh(csg_polygon)
	path_follow = trail.path_follow
