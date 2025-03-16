extends Resource
class_name Effect

## Nombre del efecto (Ej: "Burn", "Poison", "Stun")
var name: String = "Effect"

## Tipo de efecto (Buff, Debuff, CC)
@export var effect_type: Enums.AffectType

@export var duration: int = 0  

## The elemental type of the effect (Fire, Water, Shadow, etc.).
@export var elemental_type: Enums.ElementalType

@export var animation: String 
@export var sound_effect: String 


func apply(target):
    pass
