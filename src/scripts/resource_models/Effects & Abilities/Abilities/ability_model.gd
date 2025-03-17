extends Resource
class_name Ability

## ==============================
## 🔹 INFORMACIÓN BÁSICA
## ==============================

@export var name: String = "Unnamed Skill"  
@export var description: String = "No description"  
@export var cost: Array[Effect] 

@export var skill_type: Enums.SkillType = Enums.SkillType.ATTACK
@export_flags("Attack", "Buff", "Debuff", "Heal", "CC", "Corruption", "Consumption", "Vamp")
var affect_type: int = 0

@export var cooldown: int = 0  
@export var accuracy: int = 90
@export var corruption_increase: int = 0  
@export var effects: Array[Effect]

## 🔹 Define si la habilidad se usa en enemigos, aliados, o área
@export var target_type: Enums.TargetType   

@export var animation: String = "None"  
@export var sound_effect: String = "None"  

## ==============================
## 🔹 MÉTODOS
## ==============================

## Aplica la habilidad sobre el objetivo correcto
func apply(user, targets: Array):
    pass



## 🔹 Convierte los efectos en string legible
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

## 🔹 Verifica si la habilidad acierta según la precisión
func accuracy_check() -> bool:
    return randi_range(10, 100) < accuracy

    


"""
nuevo script que extiende de ability para poder 
cambiar el apply
se fija cuanto danio causo y de ahi se aplique un heal al npc.
con un % del mismo
hacer un .new de un effect de heal
agregarle a recieve_damage() un return del danio para saber cuanto hizo

ver como aplicar cosas a aliados. por ejemplo, un buff o heal

"""
