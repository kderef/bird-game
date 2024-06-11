extends CharacterBody2D

var speed = 60  # speed in pixels/sec

func _physics_process(delta):
	#movement
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	if Input.is_action_pressed("left"):
		$Sprite2D.flip_h = true
		$Sprite2D.flip_v = false
		$Sprite2D/olafanim.play("walk-loop")
	elif Input.is_action_pressed("right"):
		$Sprite2D.flip_h = false
		$Sprite2D/olafanim.play("walk-loop")
	elif Input.is_action_pressed("up"):
		$Sprite2D/olafanim.play("walk-loop")
	elif Input.is_action_pressed("down"):
		$Sprite2D/olafanim.play("walk-loop")
	else:
		$Sprite2D/olafanim.play("idle")
		
	if Input.is_action_just_pressed("run"):
		speed = 80
	if Input.is_action_just_released("run"):
		speed = 60
	move_and_slide()
