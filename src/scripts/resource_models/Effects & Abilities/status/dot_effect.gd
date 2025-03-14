extends Effect
class_name DotEffect

@export var damage: int = 15
@export var type: Enums.DamageType
@export var duration: int = 1  

func _init() -> void:
    name = "Damage Over Time Effect"
    
func apply(target):
    target.recieve_damage(damage, type, elemental_type)
