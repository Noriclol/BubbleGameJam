extends RigidBody3D

class_name PlayerMovement

@export var speed : float = 10

func _ready():
    pass

func _process(delta):
    pass

func _physics_process(delta):
    pass

func move_forward():
    linear_velocity.x = speed

func move_backward():
    linear_velocity.x = -speed




