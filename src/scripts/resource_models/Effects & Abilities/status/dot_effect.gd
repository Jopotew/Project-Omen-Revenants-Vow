extends Effect
class_name DotEffect

@export var damage: int = 15
@export var type: Enums.DamageType


func _init() -> void:
    name = "Damage Over Time Effect"
    
func apply(target):
    target.recieve_damage(damage, type, elemental_type, duration)
