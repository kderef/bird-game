extends Sprite2D

@onready var muiskes_anim: AnimationPlayer = $AnimationPlayer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    if not muiskes_anim.is_playing():
       muiskes_anim.play("muiskesbounce-loop")
