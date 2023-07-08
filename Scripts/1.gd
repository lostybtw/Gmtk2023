extends Node2D
func _ready():
	GlobalVariables.movebody = $player

func _on_door_body_entered(body):
	if body.name == "player":
		get_tree().quit()
