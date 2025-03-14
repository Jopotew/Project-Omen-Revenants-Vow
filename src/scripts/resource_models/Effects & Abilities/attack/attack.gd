extends Effect
class_name AttackEffect


@export var damage : int
@export var type: Enums.DamageType


func _init() -> void:
    name = "Attack Effect"
    
func apply(target):
    target.recieve_damage(damage, type, elemental_type)
