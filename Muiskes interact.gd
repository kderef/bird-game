extends Node2D

var interacted = false

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var sprite = $Sprite2D

const linesfirst: Array[String] = [
	"Hello, my name is scrungleton dingleberry",
	"But you can call me michael, get it because im a mouse",
	"No? Okay",
	"How long have i been on this island? I don't even know myself",
	"I've been secretly stealing food from your house",
	"Don't tell the girl though",
	"Also buy some cheese please",
	"You want to fly away from here?",
	"Why not use the boat",
	"Eh you're a bird i guess",
	"Wish i could fly",
	"Goodbye now, i know you have better things to do"
	
]

const linessecond: Array[String] = [
	"You already talked to me don't you remember?",
	"Eh, guess not everyone is as smart as me"
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
	
	
