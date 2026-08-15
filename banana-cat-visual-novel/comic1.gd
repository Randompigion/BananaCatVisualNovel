extends Node2D

func _ready() -> void:
	$%ComicSprite.frame = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("NextDialouge"):
		%Delay.start()


func _on_delay_timeout() -> void:
	if not $%ComicSprite.frame == 7:
		$%ComicSprite.frame += 1
	else:
		await Input.is_action_just_pressed("NextDialouge")
		get_tree().change_scene_to_file("res://tutorial_complete.tscn")
