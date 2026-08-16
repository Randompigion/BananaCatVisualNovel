extends CharacterBody2D
var target_position
var mouse_down = false
var start = false

#Case 1 signals
signal monkeydialouge
signal cookieCorpseDialouge
signal knifeDialouge
signal crabDialouge
signal hiddenBody
signal door
signal llama

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


#Case 1 stuff
func _on_detective_1_start_detective() -> void:
	start = true

func _on_monkey_area_mouse_entered() -> void:
	if $Area2D.get_overlapping_areas().size() >= 1:
		monkeydialouge.emit()

func _on_cookie_corpse_mouse_entered() -> void:
	if $Area2D.get_overlapping_areas().size() >= 1:
		cookieCorpseDialouge.emit()


func _on_knife_area_mouse_entered() -> void:
	if $Area2D.get_overlapping_areas().size() >= 1:
		knifeDialouge.emit()


func _on_crab_collision_mouse_entered() -> void:
	if $Area2D.get_overlapping_areas().size() >= 1:
		crabDialouge.emit()


func _on_hidden_cookie_mouse_entered() -> void:
	if $Area2D.get_overlapping_areas().size() == 1:
		hiddenBody.emit()


func _on_door_mouse_entered() -> void:
	if $Area2D.get_overlapping_areas().size() >= 1:
		door.emit()


func _on_llama_area_mouse_entered() -> void:
	if $Area2D.get_overlapping_areas().size() >= 1:
		llama.emit()
