extends CanvasLayer


@onready var on_rail_label = %On_Rail


@onready var input = %Input
@onready var velocity = %Velocity
@onready var acceleration = %Acceleration
@onready var health_ui = %HealthUI
@onready var bubble_ui = %BubbleUI
@onready var plankton_ui = %PlanktonUI
@onready var win_label = %WinLabel

signal plankton_picked_up(plankton : int)

func _ready():
    win_label.hide()
    Global.enemy_manager.win.connect(on_win)

func on_win():
    win_label.show()
