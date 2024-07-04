extends Area2D
class_name InteractionArea

@export var action_name: String = "inspect"

var interact: Callable = func():
    pass


func _on_body_entered(_body):
    InteractionManager.register_area(self)


func _on_body_exited(_body):
    InteractionManager.unregister_area(self)
