extends Button

@onready var player = get_node("/")

# Called when the node enters the scene tree for the first time.
func _ready():
    pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass

func _on_pressed():
    player.player_attack()
    pass # Replace with function body.
