extends Button

func settings():
	pass

func _ready():
	pressed.connect(settings) #FIXME
