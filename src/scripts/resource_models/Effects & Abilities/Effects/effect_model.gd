extends Resource
class_name Effect

## Nombre del efecto (Ej: "Burn", "Poison", "Stun")
var name: String = "Effect"

## Tipo de efecto (Solo un tipo: Buff, Debuff, CC, etc.)
@export var effect_type: Enums.EffectType = Enums.EffectType.NONE

@export var duration: int = 0  
@export var animation: String 
@export var sound_effect: String 


func apply(target):
    pass
