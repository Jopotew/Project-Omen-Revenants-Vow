extends Effect
class_name DecreaseSpeedEffect

@export var speed: int



func _init() -> void:
    name = "Decrease Speed"
    


func apply(target):
    target.decrease_speed(speed)
