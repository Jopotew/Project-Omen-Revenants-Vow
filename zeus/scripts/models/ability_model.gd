extends Resource
class_name Ability

## ==============================
## 🔹 BASIC INFORMATION
## ==============================

## The name of the skill.
@export var name: String = "Unnamed Skill"  

## The elemental type of the skill (Fire, Water, Shadow, etc.).
@export var skill_type: String = "None"  

## A short description of what the skill does.
@export var description: String = "No description"  

## Defines the purpose of the skill: "Attack", "Defense", "Healing", "Support", etc.
@export var action_type: String = "Attack"  


## ==============================
## 🔹 DAMAGE, DEFENSE & HEALING VALUES
## ==============================

## Base damage of the skill (0 if it does not deal damage).
@export var damage: int = 0  

## Defense bonus if this is a defensive skill (0 if not applicable).
@export var defense_value: int = 0  

## Amount of health restored if this is a healing skill (0 if not applicable).
@export var healing_value: int = 0  


## ==============================
## 🔹 SKILL COST & COOLDOWN
## ==============================

## The amount of energy, mana, or action points required to use this skill.
@export var cost: int = 0  

## Number of turns required to recharge this skill after use.
@export var cooldown: int = 0  


## ==============================
## 🔹 ACCURACY & CRITICAL HIT CHANCE
## ==============================

## The accuracy percentage of the skill (100 means it never misses).
@export var accuracy: int = 90  

## Chance of landing a critical hit, increasing damage (percentage).
@export var critical_chance: int = 0  


## ==============================
## 🔹 STATUS EFFECTS & CONDITIONS
## ==============================

## If applicable, the corruption cost for using this skill.
@export var corruption_increase: int = 0  

## The effect applied when this skill is used (e.g., "Burn", "Freeze").
@export var effect: Effect   

## The status condition inflicted by this skill (if applicable).
@export var status_affect: StatusEffect

## A list of conditions required to use this skill (e.g., "Low HP", "Corruption > 50%").
@export var conditions: Array = []  

## Number of turns that the skill effect lasts (if applicable).
@export var turn_duration: int = 0  


## ==============================
## 🔹 TARGET & APPLICATION
## ==============================

## Defines the skill’s target: "Single", "All", "Self", etc.
@export var target_type: String = "Single"  

## The name of the animation associated with this skill.
@export var animation: String = "None"  

## The sound effect played when this skill is used.
@export var sound_effect: String = "None"  
