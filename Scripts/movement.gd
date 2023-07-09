extends CharacterBody2D
@export var speed = 250

func _ready():
	$AnimationPlayer.play("idle")

func move():
	var direction = Input.get_vector("left","right","forward","back")
	velocity = direction * speed
	if GlobalVariables.movebody == self:
		if velocity != Vector2(0,0):
			if $walk_sound.playing == false:
				$walk_sound.play()
		if direction.y > 0:
			$AnimationPlayer.play("back")
		elif direction.y < 0:
			$AnimationPlayer.play("front")
		elif direction.x > 0:
			$AnimationPlayer.play("right")
		elif direction.x < 0:
			$AnimationPlayer.play("left")
		else:
			await  get_tree().create_timer(1).timeout
			$AnimationPlayer.play("idle")
		move_and_slide()
	if GlobalVariables.movebody != self and GlobalVariables.movebody != null:
		GlobalVariables.movebody.velocity = velocity
		GlobalVariables.movebody.move_and_slide()
		if GlobalVariables.movebody.is_in_group("Wheel"):
			if Input.is_action_just_pressed("rotateleft"):
				GlobalVariables.movebody.get_node("Sprite2D").frame -= 1
			if Input.is_action_just_pressed("rotateright"):
				GlobalVariables.movebody.get_node("Sprite2D").frame += 1
		
func _physics_process(delta):
	move()

func _on_area_2d_body_entered(body):
	if body.name == "player":
		SceneTransition.change_scenes(get_tree().current_scene.get_path())
		body.position -= Vector2(150,50)
	if body.name == "Box":
		body.queue_free()
		get_parent().get_node("spikes").queue_free()
		get_parent().get_node("Wall3").queue_free()
		get_parent().get_node("goal").visible = true
