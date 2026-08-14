extends Node2D
signal startcursor

func _on_textbox_finished() -> void:
	
	visible = true
	startcursor.emit()
