extends Effect
class_name IncreaseCorruptionEffect


@export var  corruption: int




func _init() -> void:
    name = "Increase Corruption"
    

func apply(target):
    target.combat_stats.increase_corruption(corruption)
