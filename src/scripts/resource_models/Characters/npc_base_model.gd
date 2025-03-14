class_name NpcCharacterModel
extends Node2D

@export var battle_conditions: BattleConditions
@export var stats: CharacterStats
var combat_stats: CharacterStats




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

## Recibe daño considerando el tipo y la afinidad elemental.
func recieve_damage(damage: int, type: Enums.DamageType, elemental_type: Enums.ElementalType):
    var checked_damage = check_element_affinity(elemental_type, damage)
    
    if type == Enums.DamageType.Magic:
        calculate_damage(checked_damage, combat_stats.magic_defense)
    elif type == Enums.DamageType.Physical:
        calculate_damage(checked_damage, combat_stats.physical_defense)
    else:
        calculate_damage(checked_damage)

## Calcula el daño recibido en base a la defensa del personaje.
func calculate_damage(checked_damage, defense_type = null):
    if defense_type == null:
        combat_stats.health -= checked_damage
    else:
        combat_stats.health -= max(1, checked_damage / defense_type)

## Modifica el daño basado en la afinidad elemental.
func check_element_affinity(elemental_type: Enums.ElementalType, damage: int) -> int:
    var element_affinity = ElementAffinity.new()
    var effectiveness = element_affinity.element_effectiveness(elemental_type, combat_stats.elemental_affinity)
    return int(damage * effectiveness)

## Reduce la salud del personaje.
func decrease_health(value):
    combat_stats.health -= value

## Aumenta la corrupción del personaje.
func increase_corruption(value):
    combat_stats.corruption += value

## Reduce la corrupción del personaje.
func decrease_corruption(value):
    combat_stats.corruption -= value

func decrease_combat_mana(value):
    combat_stats.mana -= value

func increase_combat_mana(value):
    combat_stats.mana += value


## Pasa el turno del personaje por una cantidad específica de rondas.
func turns_inactive(duration: int):
    combat_stats.turns_inactive = duration
    combat_stats.action_turn = false

## Maneja el inicio de turno del personaje.
func on_turn_start():
    if combat_stats.turns_inactive > 0:
        combat_stats.turns_inactive -= 1
        if combat_stats.turns_inactive == 0:
            combat_stats.action_turn = true



func random_number():
    return randi_range(1, 100)
