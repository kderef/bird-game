extends Node

@export var pipe_scene : PackedScene
@onready var player: CharacterBody2D = $Olaf
@onready var score_counter: Label = $score
@onready var start_playing: CanvasLayer = $start_playing
@onready var quack: AudioStreamPlayer = $Quack
@onready var bg_music: AudioStreamPlayer = $bg_music
@onready var scream: AudioStreamPlayer = $scream
@onready var ascend: AudioStreamPlayer = $ascend

var game_running : bool
var game_over : bool
var scroll : float
var score : int
const SCROLL_SPEED : float = 700
var screen_size : Vector2i
var ground_height : int
var pipes : Array
const PIPE_DELAY : int = 90
const PIPE_RANGE : int = 230

func connect_gameover_buttons():
    var btn_retry = $game_over/buttons/retry
    var btn_return = $game_over/buttons/return
    
    btn_retry.connect("button_up", func(): get_tree().reload_current_scene())
    btn_return.connect("button_up", func():
        get_tree().change_scene_to_file("res://scenes/menu.tscn")    
    )

func _ready():
    screen_size = get_window().size
    ground_height = $Ground.get_node("Sprite2D").texture.get_height()
    $game_over.hide()
    if not bg_music.playing:
        bg_music.connect("finished", bg_music.play)
        bg_music.play()
    connect_gameover_buttons()
    new_game()

func new_game():
    game_running = false
    game_over = false
    $game_over.hide()
    score = 0
    scroll = 0
    start_playing.show()
    pipes.clear()
    generate_pipes()
    player.reset()

const KEYCODE_SPACE = 32
func user_pressed_space(event) -> bool:
    return (event is InputEventKey and 
        event.keycode == KEYCODE_SPACE and
        event.pressed
    )

func _input(event):
    if game_over: return

    if user_pressed_space(event):
        if not game_running:
            start_game()
            start_playing.hide()
        elif player.flying:
                player.flap()
                quack.pitch_scale = randf_range(0.85, 1.15)
                quack.play()
                checkt_top()
    
func start_game():
    game_running = true
    player.flying = true
    player.flap()
    $PipeTimer.start()
    
func _process(delta):
    if game_running:
        scroll += SCROLL_SPEED * delta
        if scroll >= screen_size.x:
            scroll = 0
        $Ground.position.x = -scroll 
        for pipe in pipes:
            pipe.position.x -= SCROLL_SPEED * delta
            if player.position.x > pipe.position.x and not pipe.passed:
                pipe.passed = true
                score += 1
                score_counter.text = "SCORE: %d" % score

func _on_pipe_timer_timeout():
    generate_pipes()

func generate_pipes():
    var pipe = pipe_scene.instantiate()
    pipe.position.x = screen_size.x + PIPE_DELAY
    pipe.position.y = (screen_size.y - ground_height) / 2 + randi_range(-PIPE_RANGE, PIPE_RANGE)
    pipe.hit.connect(bird_hit)
    pipe.passed = false
    add_child(pipe)
    pipes.append(pipe)

func checkt_top():
    if player.position.y < 0:
        player.falling = true
        ascend.play()
        stop_game()
        
func stop_game():
    $PipeTimer.stop()
    player.flying = false
    game_running = false
    game_over = true
    $game_over/score.text = "SCORE: %d" % score
    $game_over.show()
    
func bird_hit():
    # Only play sfx once
    if not player.falling:
        $ded.play()
    player.falling = true
    stop_game()

func _on_ground_hit():
    player.falling = false
    scream.play()
    stop_game()
