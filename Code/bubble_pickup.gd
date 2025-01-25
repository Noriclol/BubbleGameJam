extends Node3D
class_name Bubble_Pickup

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is Player:
		Global.player.bubbles += 1
		queue_free()
