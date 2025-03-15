extends Resource
class_name BattleConditions


@export var is_alive: bool = true
## Obtiene si el personaje está vivo.
func get_is_alive() -> bool:
    return is_alive

## Establece si el personaje está vivo.
func set_is_alive(value: bool) -> void:
    is_alive = value


@export var in_combat: bool = false
## Obtiene si el personaje está en combate.
func get_in_combat() -> bool:
    return in_combat

## Establece si el personaje está en combate.
func set_in_combat(value: bool) -> void:
    in_combat = value


@export var action_turn: bool = false
## Obtiene si el personaje tiene el turno de actuar.
func get_action_turn() -> bool:
    return action_turn

## Establece si el personaje tiene el turno de actuar.
func set_action_turn(value: bool) -> void:
    action_turn = value


@export var combat_action: Ability
func get_combat_action():
    return combat_action
    
func set_combat_action(value):
    combat_action = value




@export var turns_inactive: int = 0
## Obtiene la cantidad de turnos en los que el personaje permanece inactivo.
func get_turns_inactive() -> int:
    return turns_inactive

## Establece la cantidad de turnos en los que el personaje permanece inactivo.
func set_turns_inactive(value: int) -> void:
    turns_inactive = value
    
## Maneja el inicio de turno del personaje.
func on_turn_start():
    if turns_inactive > 0:
        turns_inactive -= 1
        if turns_inactive == 0:
            action_turn = true

@export var skills: Array[Ability]
func get_skills() -> Array[Ability]:
    return skills

func set_skills(value: Array[Ability]) -> void:
    skills = value

## Elimina una habilidad de la lista de skills si existe.
func remove_skill(skill: Ability) -> void:
    skills.erase(skill)

## Vacía la lista de habilidades.
func clear_skills() -> void:
    skills.clear()


@export var combat_skills: Array[Ability]
func get_combat_skills() -> Array[Ability]:
    return combat_skills

func set_combat_skills(value: Array[Ability]) -> void:
    combat_skills = value

## Elimina una habilidad de la lista de habilidades de combate.
func remove_combat_skill(skill: Ability) -> void:
    combat_skills.erase(skill)

## Vacía la lista de habilidades de combate.
func clear_combat_skills() -> void:
    combat_skills.clear()


@export var items: Array
func get_items() -> Array:
    return items

func set_items(value: Array) -> void:
    items = value

## Elimina un ítem de la lista de ítems si existe.
func remove_item(item) -> void:
    items.erase(item)

## Vacía la lista de ítems.
func clear_items() -> void:
    items.clear()


@export var combat_items: Array
func get_combat_items() -> Array:
    return combat_items

func set_combat_items(value: Array) -> void:
    combat_items = value

## Elimina un ítem de la lista de ítems de combate.
func remove_combat_item(item) -> void:
    combat_items.erase(item)

## Vacía la lista de ítems de combate.
func clear_combat_items() -> void:
    combat_items.clear()


@export var combat_attacks: Array[Ability]
func get_combat_attacks() -> Array[Ability]:
    return combat_attacks

func set_combat_attacks(value: Array[Ability]) -> void:
    combat_attacks = value

## Elimina un ataque de combate de la lista.
func remove_combat_attack(attack: Ability) -> void:
    combat_attacks.erase(attack)

## Vacía la lista de ataques de combate.
func clear_combat_attacks() -> void:
    combat_attacks.clear()
