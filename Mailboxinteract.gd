extends Node2D

var interacted = false

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var sprite = $Sprite2D

const linesfirst: Array[String] = [
	"There's a letter:",
	"Dear Catherine,",
	"How have you been doing on the island?",
	"Did you make your bed today?",
	"Did you do the groceries?",
	"Sorry if i'm sounding too protective, i just really miss you",
	"The illness is really taking a toll on me, i think i have to rest more.",
	"We'll keep in touch.",
	"Love, Dad"
	
]

const linessecond: Array[String] = [
	"It's empty."
]



func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	

func _on_interact():
	if not interacted:
		DialogManager.start_dialog(global_position, linesfirst)
		await DialogManager.dialog_finished
		interacted = true
	else:
		DialogManager.start_dialog(global_position, linessecond)
		await DialogManager.dialog_finished
	
	
