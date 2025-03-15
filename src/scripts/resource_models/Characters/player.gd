class_name CharacterPlayerModel
extends CharacterBody2D


@export var battle_conditions: BattleConditions
@export var stats: CharacterStats

var combat_stats: CharacterStats

func _ready() -> void:
    combat_stats = stats
    
    
    
## Obtiene las acciones disponibles según el tipo indicado.
func get_actions(action_type: String) -> Array:
    match action_type:
        "skills":
            return battle_conditions.get_combat_skills()
        "items":
            return battle_conditions.get_combat_items()
        "attacks":
            return battle_conditions.get_combat_attacks()
        _:
            return []


## Gestiona la entrada y salida del personaje en combate.
func in_combat(value: bool):
    if value:
        battle_conditions.in_combat = value
        combat_stats = stats
    else:
        stats.health = combat_stats.health
        battle_conditions.in_combat = value
        combat_stats = stats
