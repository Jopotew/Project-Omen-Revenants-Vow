extends Effect
class_name DecreaseDamageEffect

@export var damage: int
@export var type: Enums.DamageType



func _init() -> void:
    name = "Decrease Damage"
    



func apply(target):
    target.decrease_damage(damage, type)
