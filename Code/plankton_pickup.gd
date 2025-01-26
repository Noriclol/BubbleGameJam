extends Node3D



func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is Player:
		Global.player.plankton += 1
		UI.plankton_picked_up.emit(Global.player.plankton)
		queue_free()
