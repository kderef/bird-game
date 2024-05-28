extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	pressed.connect(func():
		get_tree().quit())
	# TODO: add confirm popup

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
