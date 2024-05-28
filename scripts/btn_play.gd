extends Button

var tree

# Called when the node enters the scene tree for the first time.
func _ready():
	tree = get_tree()
	pressed.connect(func(): tree.change_scene_to_file("res://game.tscn"))
	# TODO: add transition
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
