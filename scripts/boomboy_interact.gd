extends Node2D

var interacted = false

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var sprite = $Sprite2D

const linesfirst: Array[String] = [
	"I used to battle, a long time ago...",
	"Those days are far gone now.",
	"I think I remember something about flying notes in the air, not sure though.",
]

const linessecond: Array[String] = [
	"..............",
	"Aren't you supposed to be somewhere?"
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
