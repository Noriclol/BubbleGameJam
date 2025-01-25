extends Node

var player : Player

var trails: Array[Trail]



func find_trail_belonging_to_mesh(mesh : CSGPolygon3D) -> Trail:
	for trail in Global.trails:
		if trail.csg_mesh == mesh:
			return trail
	return null
