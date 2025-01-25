extends RigidBody3D
class_name Player



@export var path_follow : PathFollow3D = null

@onready var player_mesh : MeshInstance3D = %MeshInstance3D

@onready var ground_check: ShapeCast3D = %GroundCheck
@onready var wall_check_left: RayCast3D = %WallCheck_Left
@onready var wall_check_right: RayCast3D = %WallCheck_Right

@onready var hurt_module : Hurt = %Hurt
@onready var health : Health = %Health
@onready var shoot : Shoot = %Shoot
@onready var muzzle : Muzzle = %Muzzle


signal jumped_on_trail(trail : Trail)

func _init() -> void:
	Global.player = self
	pass
	

func _ready() -> void:
	hurt_module.hurt.connect(health.apply_damage)
	health.take_damage.connect(player_took_damage)
	health.die.connect(player_died)


func is_colliding_with_ground() -> bool:
	if ( ground_check.is_colliding()):
		var collider =  ground_check.get_collider(1)
		if collider and collider.is_in_group("ground"):
			return true
	return false
	
func player_died():
	print("player_died")
	player_mesh.queue_free()
	
func player_took_damage(damage:int):
	print("player took " + str(damage) + "Damage")
