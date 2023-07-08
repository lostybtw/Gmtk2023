extends CanvasLayer

func _on_play_pressed():
	SceneTransition.change_scenes("res://Scenes/1.tscn")
func _on_quit_pressed():
	get_tree().quit()
