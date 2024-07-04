extends CharacterBody2D

var attack_index = 1

func player_attack():
    $player_sprite_idle.visible = false
    $player_sprite_attack.visible = true
    
    if attack_index > 3:
        attack_index = 1
    else:
        attack_index += 1

    if attack_index == 1:
        $player_sprite_attack/attackanim.play("attackanim1")
    elif attack_index == 2:
        $player_sprite_attack/attackanim.play("attackanim2")
    else:
        $player_sprite_attack/attackanim.play("attackanim3")

func player_idle():
    $player_sprite_idle.visible = true
    $player_sprite_attack.visible = false
    $player_sprite_idle/idleanim.play("idleanim")

func _ready():
    player_idle()

func _process(delta):
    if Input.is_action_just_pressed("right"):
        player_attack()
    if not $player_sprite_attack/attackanim.is_playing():
        player_idle()
