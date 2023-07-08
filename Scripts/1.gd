extends Node2D
func _ready():
	if GlobalVariables.songpos != null:
		$music.play(GlobalVariables.songpos)
	else:
		$music.play()
	GlobalVariables.movebody = $player
func _on_door_body_entered(body):
	if body.name == "player":
		print(get_tree().current_scene)
		SceneTransition.change_scenes("res://Scenes/2.tscn")
		GlobalVariables.songpos = $music.get_playback_position()
