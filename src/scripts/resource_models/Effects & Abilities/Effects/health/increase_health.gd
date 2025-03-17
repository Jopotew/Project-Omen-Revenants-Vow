extends Effect
class_name IncreaseHealthEffect

@export var health: int


func _init() -> void:
    name = "Increase Health"


func apply(target):
    target.combat_stats.increase_health(health)
