extends Effect
class_name AttackEffect


@export var damage : int
@export var type: Enums.DamageType


func _init() -> void:
    name = "Attack Effect"
    
func apply(target):
    return target.combat_stats.recieve_damage(damage, type)
