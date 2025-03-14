extends Resource
class_name Ability

## ==============================
## 🔹 BASIC INFORMATION
## ==============================

## The name of the skill.
@export var name: String = "Unnamed Skill"  


## A short description of what the skill does.
@export var description: String = "No description"  

## The amount of energy, mana, or action points required to use this skill.
@export var cost: Array[Effect] 

@export var type: Enums.AffectType


@export var state: Enums.CombatState

## Number of turns required to recharge this skill after use.
@export var cooldown: int = 0  

## The accuracy percentage of the skill (100 means it never misses).
#@export var accuracy: int = 90  

### If applicable, the corruption cost for using this skill.
@export var corruption_increase: int = 0  

## The effect applied when this skill is used (e.g., "Burn", "Freeze").
@export var effects : Array[Effect]

## Defines the skill’s target: "Single", "All", "Self", etc.
@export var target_type: String = "Single"  

## The name of the animation associated with this skill.
@export var animation: String = "None"  

## The sound effect played when this skill is used.
@export var sound_effect: String = "None"  


func apply(user, target):
    #Aplicar Costos 
    for effect in cost:
        effect.apply(user)
    #Aplicar Efectos
    for effect in effects:
        effect.apply(target)
