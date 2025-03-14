extends Effect

class_name DecreaseHealthEffect

@export var health: int



func _init() -> void:
    name = "Decrease Health"
    

func apply(target):
    target.decrease_health(health)
