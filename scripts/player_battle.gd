extends CharacterBody2D

enum PlayerState {
    Idle, Act
}

var player_state = PlayerState.Idle

func _ready():
    pass

func _process(delta):
    match player_state:
            PlayerState.Idle:
                $player_sprite_idle.visible = true
                $player_sprite_attack.visible = false
                $player_sprite_idle/idleanim.play("a")
            PlayerState.Act:
                $player_sprite_idle.visible = false
                $player_sprite_attack.visible = true
                $player_sprite_attack/attackanim.play("a")
