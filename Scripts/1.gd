extends Node2D
var song = GlobalVariables.song
func _ready():
	var path = "res://Assets/" + GlobalVariables.song + ".mp3"
	var file = FileAccess.open(path, FileAccess.READ)
	file = file.get_buffer(file.get_length())
	var stream = AudioStreamMP3.new()
	stream.data = file
	stream.loop = true
	$music.stream = stream
	if GlobalVariables.songpos != null:
		$music.play(GlobalVariables.songpos)
	else:
		$music.play()
	GlobalVariables.movebody = $player
func _process(delta):
	if GlobalVariables.song != song:
		var path = "res://Assets/" + GlobalVariables.song + ".mp3"
		var file = FileAccess.open(path, FileAccess.READ)
		file = file.get_buffer(file.get_length())
		var stream = AudioStreamMP3.new()
		stream.data = file
		$music.stream = stream
		$music.play()
		song = GlobalVariables.song
		$goal.visible = true
	if get_tree().current_scene.get_path() == NodePath("/root/5"):
		if $wheel/Sprite2D.frame == 0 and $wheel2/Sprite2D.frame == 2 and $wheel3/Sprite2D.frame == 2:
			$goal.visible = true
func _on_door_body_entered(body):
	if body.name == "player":
		SceneTransition.change_scenes("res://Scenes/2.tscn")
		GlobalVariables.songpos = $music.get_playback_position()
func _on_bass_area_mouse_entered():
	pass # Replace with function body.
func _on_area_2d_body_entered(body):
	if body.name == "bass":
		GlobalVariables.song = "song1"
	elif body.name == "treble":
		GlobalVariables.song = "song2"

func _on_goal4_body_entered(body):
	if body.name == "player":
		SceneTransition.change_scenes("res://Scenes/5.tscn")
