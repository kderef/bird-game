extends Sprite2D

func _ready():
	$boomboyidle.play("boomboy_loop")

func _process(_delta):
	if not $boomboyidle.is_playing():
		$boomboyidle.play("boomboy_loop")
