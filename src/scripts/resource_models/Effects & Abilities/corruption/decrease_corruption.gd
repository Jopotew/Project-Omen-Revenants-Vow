extends Effect
class_name DecreaseCorruptionEffect


@export var corruption: int



func _init() -> void:
    name = "Decrease Corruption"
    

func apply(target):
    target.combat_stats.decrease_corruption(corruption)
