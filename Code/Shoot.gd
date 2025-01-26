extends Node
class_name Shoot

@onready var projectile_scene = preload("res://Scenes/Projectile/projectile.tscn")

signal send_bubble_count(bubbles : int)


func shoot(muzzle : Muzzle, shoot_direction : Enum.ShootDirection) -> void:
	if (Global.player.bubbles >= 1):
		Global.player.bubbles -= 1
		var projectile = projectile_scene.instantiate()
		muzzle.add_child(projectile)
		projectile.transform = muzzle.transform
		send_bubble_count.emit(Global.player.bubbles)

		if shoot_direction == Enum.ShootDirection.LEFT:
			projectile.apply_impulse(Vector3.FORWARD * 10)
		else:
			projectile.apply_impulse(Vector3.BACK * 10)
