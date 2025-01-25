extends Area3D
class_name Hurt

signal hurt(damage:int)
	

func _on_area_entered(area: Area3D) -> void:
	if area is Hit:
		var hit = area as Hit
		hurt.emit(hit.data.amount)
