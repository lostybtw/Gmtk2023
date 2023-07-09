extends Node2D
var node_name = ""
var corsair = load("res://Assets/corsair.png")
var reversing = false

func transformation(node):
		$selectsound.play()
		GlobalVariables.movebody = get_parent().get_parent().get_node(node)
		Input.set_custom_mouse_cursor(null)
		get_tree().paused = false
		reversing = false

func _on_reverse_pressed():
	reversing = true

func _physics_process(delta):
	if reversing:
		get_tree().paused = true
		var mpos = get_viewport().get_mouse_position()
		Input.set_custom_mouse_cursor(corsair)
		if Input.is_action_just_pressed("mouseleft"):
			if node_name != "":
				transformation(node_name)
			else:
				node_name = ""

func _on_wall_area_mouse_entered():
	node_name = "Wall"
func _on_box_area_mouse_entered():
	node_name = "Box"
func _on_player_mouse_entered():
	node_name = "player"
func _on_wall_area_2_mouse_entered():
	node_name = "Wall2"
func _on_goal_area_mouse_entered():
	node_name = "goal"
func _on_wall_area_3_mouse_entered():
	node_name = "Wall3"
func _on_wall_area_4_mouse_entered():
	node_name = "Wall4"
func _on_wall_area_mouse_exited():
	node_name = ""
func _on_clef_area_mouse_entered():
	node_name = "clef_place"
func _on_bass_area_mouse_entered():
	node_name = "bass"
func _on_treble_area_mouse_entered():
	node_name = "treble"
func _on_box_area_2_mouse_entered():
	node_name = "Box2"
func _on_wheel_area_mouse_entered():
	node_name = "wheel"
func _on_wheel_area_3_mouse_entered():
	node_name = "wheel3"
func _on_wheel_area_2_mouse_entered():
	node_name = "wheel2"
