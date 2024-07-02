extends CenterContainer

# RNG
var random = RandomNumberGenerator.new()

var   beat_speed  = 60
const NOTE_WIDTH  = 50.0
const NOTE_HEIGHT = 50.0

@onready var bounds = $Beatspace.get_rect()
@onready var note_begin = bounds.position.x + bounds.size.x
@onready var notes: Array[Sprite2D] = []
@onready var note_dist = NOTE_WIDTH * 2.0

@onready var beat_atk1 = $beat_atk1
@onready var beat_atk2 = $beat_atk2
@onready var beat_def  = $beat_def

func push_note(array):
    var rand = random.randi_range(0, 2)
    var node
    match rand:
        0: node = beat_atk1.duplicate()
        1: node = beat_atk2.duplicate()
        2: node = beat_def.duplicate()
    node.visible = true
    array.push_back(node)

# Called when the node enters the scene tree for the first time.
func _ready():
    push_note(notes)

var last_note: Rect2
func _process(delta):
    if last_note.position.x <= bounds.position.x - note_dist:
        #notes.push_back(Rect2(note_begin, bounds.position.y))
        push_note(notes)
    for note in notes:
        note.position.x -= beat_speed * delta
