extends CharacterBody2D

enum PlayerState {
    Idle, Act
}

var player_state = PlayerState.Idle

func play_animation():
    match player_state:
        PlayerState.Idle:
            $player_sprite_idle.visible = true
            $player_sprite_attack.visible = false
            $player_sprite_idle/idleanim.play("idleanim")
        PlayerState.Act:
            $player_sprite_idle.visible = false
            $player_sprite_attack.visible = true
            # TODO: add attack animation (NOTE: first: fix spritesheet)
            #$player_sprite_attack/attackanim.play("attackanim")

func _ready():
    play_animation()

func _process(delta):
    play_animation()
