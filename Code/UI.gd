extends CanvasLayer


@onready var on_rail_label = %On_Rail


@onready var input = %Input
@onready var velocity = %Velocity
@onready var acceleration = %Acceleration
@onready var health_ui = %HealthUI
@onready var bubble_ui = %BubbleUI
@onready var plankton_ui = %PlanktonUI

signal plankton_picked_up(plankton : int)
