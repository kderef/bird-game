extends Node2D


@onready var interaction_area: InteractionArea = $InteractionArea
@onready var sprite = $Sprite2D

const lines: Array[String] = [
	"Man, i wonder what's out there.",
	"You know, beyond this island.",
	"Lets see."
	
]



func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	

func _on_interact():
	DialogManager.start_dialog(global_position, lines)
	await DialogManager.dialog_finished
	get_tree().change_scene_to_file("res://scenes/flapgame.tscn")
