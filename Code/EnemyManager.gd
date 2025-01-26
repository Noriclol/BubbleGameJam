extends Node

class_name EnemyManager

var enemy_array : Array[Enemy] = []

signal win()

func _ready():
    Global.enemy_manager = self



