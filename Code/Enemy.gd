extends RigidBody3D

class_name Enemy

@export var health : Health

var speed : float = 0.2
var path_follow : PathFollow3D = null
var should_follow : bool = false

func _ready() -> void:
	Global.enemy_manager.enemy_array.append(self)
	health.die.connect(on_die)

func _physics_process(delta:float) -> void:
	if should_follow:
		move_enemy(delta)


func move_enemy(delta:float) -> void:
	# move enemy towards player
	var direction = (Global.player.global_transform.origin - global_transform.origin).normalized()
	print(direction.z)
	if direction.z < 0:
		Global.enemy_manager.path_follow.progress -= speed * delta
	else:
		Global.enemy_manager.path_follow.progress += speed * delta



func _on_trigger_area_body_entered(body:Node3D) -> void:
	if body is Player:
		should_follow = true
		
func on_die() -> void:
	Global.enemy_manager.enemy_array.erase(self)

	if (Global.enemy_manager.enemy_array.size() == 0):
		Global.enemy_manager.win.emit()

	print("Enemy Died")
