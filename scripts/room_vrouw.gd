extends Sprite2D

func _process(delta):
    if not $vrouw/AnimationPlayer.is_playing():
        $vrouw/AnimationPlayer.play("girlwalk")
