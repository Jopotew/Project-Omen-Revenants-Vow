extends Effect
class_name DecreaseDefenseEffect

@export var defense: int = 0
@export  var type: Enums.DefenseType

func _init() -> void:
    name = "Decrease Defense"

func apply(target):
    target.decrease_defense(defense, type)
