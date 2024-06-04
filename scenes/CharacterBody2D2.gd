extends CharacterBody2D

var speed = 60  # speed in pixels/sec

func _physics_process(delta):
	#movement
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	if Input.is_action_pressed("left"):
		$Sprite2D.flip_h = true
		$Sprite2D.flip_v = false

	if Input.is_action_just_pressed("right"):
		$Sprite2D.flip_h = false
		$Sprite2D.flip_v = false
		
	if Input.is_action_just_pressed("run"):
		speed = 80
	if Input.is_action_just_released("run"):
		speed = 60
	move_and_slide()
	
	if velocity == Vector2(0, 0):
		$Sprite2D/olafanim.play("idle-loop")
	if velocity > Vector2(0,0):
		$Sprite2D/olafanim.stop()
