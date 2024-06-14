extends CharacterBody2D

const SPEED_NORMAL = 4000
const SPEED_FAST = SPEED_NORMAL * 1.5

var speed = SPEED_NORMAL  # speed, compensated by delta time.

func _physics_process(delta):
    #movement
    var direction = Input.get_vector("left", "right", "up", "down")
    velocity = (direction * speed) * delta
    if Input.is_action_pressed("left"):
        $player_sprite.flip_h = true
        $player_sprite.flip_v = false
        $player_sprite/olafanim.play("walk-loop")
    elif Input.is_action_pressed("right"):
        $player_sprite.flip_h = false
        $player_sprite/olafanim.play("walk-loop")
    elif Input.is_action_pressed("up"):
        $player_sprite/olafanim.play("walk-loop")
    elif Input.is_action_pressed("down"):
        $player_sprite/olafanim.play("walk-loop")
    else:
        $player_sprite/olafanim.play("idle")
        
    if Input.is_action_just_pressed("run"):
        speed = SPEED_FAST
    if Input.is_action_just_released("run"):
        speed = SPEED_NORMAL
    
    move_and_slide()

