extends Node2D
var entered_wall = false
var entered_box = false

func transformation(node):
			GlobalVariables.movebody = get_parent().get_node(node)
			$Corsair.visible = false
			get_tree().paused = false

func _on_reverse_pressed():
	$Corsair.visible = true
	get_tree().paused = true

func _physics_process(delta):
	if $Corsair.visible == true:
		var mpos = get_viewport().get_mouse_position()
		$Corsair.position = mpos
	if Input.is_action_just_pressed("mouseleft"):
		if entered_wall:
			transformation("Wall")
		if entered_box:
			transformation("Box")


func _on_wall_area_mouse_entered():
	entered_wall = true

func _on_box_area_entered():
	entered_box = true
