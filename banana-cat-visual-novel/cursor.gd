extends CharacterBody2D
var target_position
var mouse_down = false
var start = false

func _ready():
	visible = false
	await start == true
	visible = true
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	await start == true
	target_position = get_global_mouse_position()
	global_position = global_position.lerp(target_position, delta*5)
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		mouse_down = true
	else:
		mouse_down = false


func _on_right_spot_area_entered(area: Area2D) -> void:
	if mouse_down or Input.is_action_pressed("HideDialouge"):
		#This needs to change, placeholder
		print("IT SHOULD WORK???")
		get_tree().change_scene_to_file("res://tutorial_complete.tscn")


func _on_tutorial_wrong_startcursor() -> void:
	start = true


func _on_kill_zone_body_entered(body: Node2D) -> void:
	position.x = 0
	position.y = 0
