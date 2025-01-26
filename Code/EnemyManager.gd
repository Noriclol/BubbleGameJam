extends Node

class_name EnemyManager

var enemy_array : Array[Enemy] = []
@export var path_follow : PathFollow3D

signal win()

func _ready():
    Global.enemy_manager = self



