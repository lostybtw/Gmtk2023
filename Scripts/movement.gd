extends CharacterBody2D
@export var speed = 250

func _ready():
	$AnimationPlayer.play("idle")

func move():
	var direction = Input.get_vector("left","right","forward","back")
	velocity = direction * speed
	if GlobalVariables.movebody == self:
		if direction != Vector2(0,0):
			#$walk_sound.play(3.0)
			pass
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
func _physics_process(delta):
	move()

func _on_area_2d_body_entered(body):
	if body.name == "player":
		SceneTransition.change_scenes(get_tree().current_scene.get_path())
	if body.name == "Box":
		body.visible = false
