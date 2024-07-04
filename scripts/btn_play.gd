extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
    var tree = get_tree()
    pressed.connect(func(): tree.change_scene_to_file("res://scenes/house.tscn"))
    # TODO: add transition
