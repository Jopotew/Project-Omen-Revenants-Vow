extends Effect
class_name IncreaseSpeedEffect

@export var speed: int 


func _init() -> void:
    name = "Increase Speed"


func apply(target):
    target.increase_speed(speed)
