extends Effect
class_name IncreaseDefenseEffect

@export var defense: int = 0
@export  var type: Enums.DefenseType




func _init() -> void:
    name = "Increase Defense"
    


func apply(target):
    target.combat_stats.increase_defense(defense, type)
