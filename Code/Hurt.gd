extends Area3D
class_name Hurt

signal hurt(damage:int)
	

func _on_area_entered(area: Area3D) -> void:
	print("on_Area_entered")
	if area is Hit:
		print("Area is hit")
		var hit = area as Hit
		hurt.emit(hit.data.amount)
