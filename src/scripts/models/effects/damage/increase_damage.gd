extends Effect
class_name IncreaseDamageEffect

@export var damage: int
@export var type: Enums.DamageType



func _init() -> void:
    name = "Increase Damage"
    



func apply(target):
    target.increase_damage(damage, type)
