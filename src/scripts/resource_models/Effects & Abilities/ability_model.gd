extends Resource
class_name Ability

## ==============================
## 🔹 INFORMACIÓN BÁSICA
## ==============================

## Nombre de la habilidad.
@export var name: String = "Unnamed Skill"  

## Descripción de la habilidad.
@export var description: String = "No description"  

## Costo de uso (mana, energía, etc.).
@export var cost: Array[Effect] 

## 🔹 Tipo Principal de la Habilidad (Cómo se usa)
@export var skill_type: Enums.SkillType = Enums.SkillType.ATTACK

## 🔹 Efectos Secundarios (Qué hace la habilidad)
@export_flags("Attack", "Buff", "Debuff", "Heal", "CC", "Corruption", "Consumption", "Vamp")
var affect_type: int = 0

## Número de turnos de recarga después de usar la habilidad.
@export var cooldown: int = 0  

@export var accuracy: int = 90

## Aumento de corrupción al usar la habilidad.
@export var corruption_increase: int = 0  

## Efectos aplicados cuando se usa la habilidad.
@export var effects: Array[Effect]

## Tipo de objetivo ("Single", "All", "Self", etc.).
@export var target_type: Enums.TargetType   

## Animación que se ejecuta al usar la habilidad.
@export var animation: String = "None"  

## Sonido asociado a la habilidad.
@export var sound_effect: String = "None"  


## Aplica la habilidad sobre el objetivo.
func apply(user, target):
    pass


func get_affect_type_string() -> String:
    var affect_names = {
        Enums.AffectType.ATTACK: "Attack",
        Enums.AffectType.BUFF: "Buff",
        Enums.AffectType.DEBUFF: "Debuff",
        Enums.AffectType.HEAL: "Heal",
        Enums.AffectType.CC: "CC",
        Enums.AffectType.CORRUPTION: "Corruption",
        Enums.AffectType.CONSUMPTION: "Consumption",
        Enums.AffectType.VAMP: "Vamp"
    }
    
    var result = []
    for key in affect_names.keys():
        if affect_type & key:
            result.append(affect_names[key])
    
    return " & ".join(result) if result.size() > 0 else "None"


##Checks Accuracy for the Ability. Return True if usable, False if not.
func accuracy_check() -> bool:
    var prob = randi_range(10, 100)
    var value: bool
    if prob < accuracy:
        value = true
        return value
    value = false
    return value
    
    


"""
nuevo script que extiende de ability para poder 
cambiar el apply
se fija cuanto danio causo y de ahi se aplique un heal al npc.
con un % del mismo
hacer un .new de un effect de heal
agregarle a recieve_damage() un return del danio para saber cuanto hizo

ver como aplicar cosas a aliados. por ejemplo, un buff o heal

"""
