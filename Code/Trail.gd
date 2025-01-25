extends Path3D
class_name Trail

@export var path_follow : PathFollow3D
@export var csg_mesh : CSGPolygon3D


func _ready() -> void:
	Global.trails.append(self)
	pass#csg_mesh.



func check_end() -> bool:
	var points = curve.get_baked_points()
	var points_recalc : PackedVector3Array
	for point in points:
		var new_point = point + global_position
		points_recalc.append(new_point)
	
	var player_pos = Global.player.global_position
	
	var point_distance_dict : Dictionary = {}
	
	for point in points_recalc:
		point_distance_dict[point] = point.distance_squared_to(player_pos)
	
	
	
	return 0
