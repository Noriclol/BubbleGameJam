extends Node
class_name Shoot

@onready var projectile_scene = preload("res://Scenes/Projectile/projectile.tscn")

func shoot(muzzle : Muzzle) -> void:
	var projectile = projectile_scene.instantiate()
	muzzle.add_child(projectile)
	projectile.transform = muzzle.transform
