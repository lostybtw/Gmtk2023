extends CharacterBody2D
@export var speed = 500

func move():
	var direction = Input.get_vector("left","right","forward","back")
	velocity = direction * speed
	if GlobalVariables.movebody == self:
		move_and_slide()
	if GlobalVariables.movebody != self and GlobalVariables.movebody != null:
		GlobalVariables.movebody.position += velocity * get_physics_process_delta_time()
func _physics_process(delta):
	move()


func _on_wall_area_mouse_shape_entered(shape_idx):
	pass # Replace with function body.
