extends Node2D


@onready var interaction_area: InteractionArea = $InteractionArea
@onready var sprite = $Sprite2D

const lines: Array[String] = [
	"jabbadabbadoo jay",
	"it's a shame they're not playing",
	"the",
	"skibidi",
	"toilet",
	"show"
	
]




func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	

func _on_interact():
	DialogManager.start_dialog(global_position, lines)
	await DialogManager.dialog_finished
