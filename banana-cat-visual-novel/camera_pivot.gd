extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x = 0
	position.y = 0



func _on_right_mouse_entered() -> void:
	position.x = 957.0

func _on_left_mouse_entered() -> void:
	position.x = -961.0
