extends CanvasLayer

func change_scenes(target: String):
	$AnimationPlayer.play("dissolve")
	await $AnimationPlayer.is_playing()
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play_backwards("dissolve")
