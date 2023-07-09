extends CharacterBody2D

func _process(delta):
	if get_parent().get_node("Wall").position.y > get_parent().get_node("Wall2").position.y + 50 and get_parent().get_node("Wall2").position.y < get_parent().get_node("Wall").position.y -50 and  get_parent().get_node("Wall3").position.x > get_parent().get_node("Wall4").position.x + 50 and get_parent().get_node("Wall4").position.x < get_parent().get_node("Wall3").position.x - 50:
		visible = true
		$wall_area/CollisionPolygon2D.disabled = false
		$CollisionShape2D.disabled = false
		$door/CollisionShape2D.disabled = false
func _on_door_body_entered(body):
	if body.name == "player":
		var current = get_tree().current_scene.get_path()
		if current == NodePath("/root/5"):
			SceneTransition.change_scenes("res://Scenes/win.tscn")
		elif current == NodePath("/root/2"):
			SceneTransition.change_scenes("res://Scenes/3.tscn")

func _on_goal3_body_entered(body):
	if body.name == "player":
		SceneTransition.change_scenes("res://Scenes/4.tscn")

func _on_goal5_body_entered(body):
	if body.name == "player":
		SceneTransition.change_scenes("res://Scenes/win.tscn")


func _on_door_2_left_body_entered(body):
	if body.name == "player":
		SceneTransition.change_scenes("res://Scenes/1.tscn")
