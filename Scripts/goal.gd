extends CharacterBody2D

func _process(delta):
	if get_parent().get_node("Wall").position.y > get_parent().get_node("Wall2").position.y + 50 and get_parent().get_node("Wall2").position.y < get_parent().get_node("Wall").position.y -50 and  get_parent().get_node("Wall3").position.x > get_parent().get_node("Wall4").position.x + 50 and get_parent().get_node("Wall4").position.x < get_parent().get_node("Wall3").position.x - 50:
		visible = true
		$wall_area/CollisionPolygon2D.visible = true
		$CollisionShape2D.visible = true
		$door/CollisionShape2D.visible = true
func _on_door_body_entered(body):
	if body.name == "player":
		SceneTransition.change_scenes("res://Scenes/1.tscn")
