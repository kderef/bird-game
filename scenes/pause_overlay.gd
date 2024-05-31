extends ColorRect

var pause_ui: VBoxContainer
var camera: Camera2D

func resize():
	var new_size = camera.get_viewport_rect().size
	size = new_size
	pause_ui.size = new_size

# Called when the node enters the scene tree for the first time.
func _ready():
	camera = get_node("/root/Node2D/CharacterBody2D2/Sprite2D/Camera2D")
	pause_ui = get_node("/root/Node2D/CharacterBody2D2/Sprite2D/Camera2D/pause_ui")
	visible = false
	pause_ui.visible = false
	size = get_viewport_rect().size
	set_process_input(true) 
	get_tree().get_root().size_changed.connect(resize)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("menu"):
		visible = not visible
		pause_ui.visible = visible
		get_tree().paused = visible

