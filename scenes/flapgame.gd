extends Node

@export var pipe_scene : PackedScene

var game_running : bool
var game_over : bool
var scroll : int
var score
const SCROLL_SPEED : float = 800
var screen_size : Vector2i
var ground_height : int
var pipes : Array
const PIPE_DELAY : int = 80
const PIPE_RANGE : int = 200


func _ready():
	screen_size = get_window().size
	ground_height = $Ground.get_node("Sprite2D").texture.get_height()
	new_game()

func new_game():
	game_running = false
	game_over = false
	score = 0
	scroll = 0
	pipes.clear()
	generate_pipes()
	$Olaf.reset()


func _input(event):
	if game_over == false:
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
				if game_running == false:
					start_game()
				else:
					if $Olaf.flying:
						$Olaf.flap()
						$Quack.play()
						checkt_top()
	
func start_game():
	game_running = true
	$Olaf.flying = true
	$Olaf.flap()
	$PipeTimer.start()
	
func _process(delta):
	if game_running:
		scroll += SCROLL_SPEED * delta
		if scroll >= screen_size.x:
			scroll = 0
		$Ground.position.x = -scroll * delta
		for pipe in pipes:
			pipe.position.x -= SCROLL_SPEED * delta
	


func _on_pipe_timer_timeout():
	generate_pipes()



func generate_pipes():
	var pipe = pipe_scene.instantiate()
	pipe.position.x = screen_size.x + PIPE_DELAY
	pipe.position.y = (screen_size.y - ground_height) / 2 + randi_range(-PIPE_RANGE, PIPE_RANGE)
	pipe.hit.connect(bird_hit)
	add_child(pipe)
	pipes.append(pipe)

func checkt_top():
	if $Olaf.position.y < 0:
		$Olaf.falling = true
		stop_game()
		
func stop_game():
	$PipeTimer.stop()
	$Olaf.flying = false
	game_running = false
	game_over = true
	
func bird_hit():
	$Olaf.falling = true
	stop_game()
	pass



func _on_ground_hit():
	$Olaf.falling = false
	stop_game()