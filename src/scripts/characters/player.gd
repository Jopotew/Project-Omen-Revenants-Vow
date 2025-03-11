class_name CharacterPlayerModel
extends CharacterBody2D

@export var stats: CharacterStats
var combat_stats : CharacterStats


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~📌 Identidad y Nivel~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

## Nombre del personaje
func get_char_name() -> String:
    return stats.name

func set_char_name(value: String) -> void:
    stats.name = value

## Nivel
func get_level() -> int:
    return stats.level

func set_level(value: int) -> void:
    stats.level = value

## Experiencia
func get_experience() -> float:
    return stats.experiencie

func set_experience(value: float) -> void:
    stats.experiencie = value

## Multiplicador de experiencia
func get_exp_multiplier() -> float:
    return stats.exp_multiplier

func set_exp_multiplier(value: float) -> void:
    stats.exp_multiplier = value

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~⚔️ Atributos de Combate~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

## Salud
func get_health() -> int:
    return stats.health

func set_health(value: int) -> void:
    stats.health = clamp(value, 0, stats.max_health)

## Salud máxima
func get_max_health() -> int:
    return stats.max_health

func set_max_health(value: int) -> void:
    stats.max_health = value
    stats.health = clamp(stats.health, 0, stats.max_health)

## Mana
func get_mana() -> int:
    return stats.mana

func set_mana(value: int) -> void:
    stats.mana = clamp(value, 0, stats.max_mana)

## Mana máximo
func get_max_mana() -> int:
    return stats.max_mana

func set_max_mana(value: int) -> void:
    stats.max_mana = value
    stats.mana = clamp(stats.mana, 0, stats.max_mana)

## Ataque físico
func get_physical_attack() -> float:
    return stats.physical_attack

func set_physical_attack(value: float) -> void:
    stats.physical_attack = value

## Ataque mágico
func get_magic_attack() -> float:
    return stats.magic_attack

func set_magic_attack(value: float) -> void:
    stats.magic_attack = value

func get_attack_accuracy():
    return stats.attack_accuracy

func set_attack_accuracy(value: int):
    stats.attack_acuracy = value

func get_affected_by_effect():
    return stats.affected_by_effect
    
func set_affected_by_effect(value: bool):
    stats.affected_by_effect = value

func get_effect():
    return stats.effect
    
func set_effect(value: Effect):
    stats.effect = value

## Defensa física
func get_physical_defense() -> float:
    return stats.physical_defense

func set_physical_defense(value: float) -> void:
    stats.physical_defense = value

## Defensa mágica
func get_magic_defense() -> float:
    return stats.magic_defense

func set_magic_defense(value: float) -> void:
    stats.magic_defense = value

## Velocidad
func get_speed() -> int:
    return stats.speed

func set_speed(value: int) -> void:
    stats.speed = value

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~🕵️ Estado y Condiciones~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

## Si está vivo
func get_is_alive() -> bool:
    return stats.is_alive

func set_is_alive(value: bool) -> void:
    stats.is_alive = value

## Si es controlable
func get_is_controllable() -> bool:
    return stats.is_controllable

func set_is_controllable(value: bool) -> void:
    stats.is_controllable = value

## Si tiene turno
func get_action_turn() -> bool:
    return stats.action_turn

func set_action_turn(value: bool) -> void:
    stats.action_turn = value

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~👁️‍🗨️ Corrupción y Resistencias~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

## Corrupción
func get_corruption() -> float:
    return stats.corruption

func set_corruption(value: int) -> void:
    stats.corrupntion = value

## Multiplicador de corrupción
func get_corruption_multiplier() -> float:
    return stats.corruption_multiplier

func set_corruption_multiplier(value: float) -> void:
    stats.corruption_multiplier = value

## Resistencia
func get_corruption_resistance() -> float:
    return stats.resistance_to_corruption

func set_resistance(value: float) -> void:
    stats.resistance_to_corruption = value

## Si está corrompido
func get_is_corrupted() -> bool:
    return stats.is_corrupted

func set_is_corrupted(value: bool) -> void:
    stats.is_corrupted = value

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~🎮 Habilidades y Equipamiento~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

## Habilidades
func get_skills() -> Array[Ability]:
    return stats.skills

func set_skills(value: Ability) -> void:
    stats.skills.append(value)

## Habilidades de combate
func get_combat_skills() -> Array:
    return stats.combat_skills

func set_combat_skills(value: Array) -> void:
    stats.combat_skills = value
    


## Objetos
func get_items() -> Array:
    return stats.items

func set_items(value) -> void:
    stats.items = value

func remove_item(item_rem):
    for item in stats.items:
        if item.name == item_rem.name:
            stats.items.erase(item)

func remove_combat_item(item_rem):
    for item in stats.combat_items:
        if item.name == item_rem.name:
            stats.combat_items.erase(item)
    
func clear_items():
    stats.items.clear()
    
func clear_combat_items():
    stats.combat_items.clear()   

## Objetos de combate
func get_combat_items() -> Array:
    return stats.combat_items

func set_combat_items(value: Array) -> void:
    stats.combat_items = value

## Ataques de combate
func get_combat_attacks() -> Array:
    return stats.combat_attacks

func set_combat_attacks(value: Array) -> void:
    stats.combat_attacks = value
    
    
func get_actions() -> Dictionary:
    var skills = get_combat_skills()
    var attacks = get_combat_attacks()
    var items = get_combat_items()
    
    var actions: Dictionary = {
        "skills": [skills],
        "items": [items],
        "attacks": [attacks]
    }
    
    return actions

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~📏 Tamaño en Escena de Combate~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

## Obtener dimensiones
func get_dimensions() -> Vector2:
    return Vector2(stats.width, stats.height)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~🛠️ Funciones de Juego~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

## Subir de nivel
func level_up() -> void:
    set_level(stats.level + 1)
    set_max_health(stats.max_health + 10)
    set_max_mana(stats.max_mana + 5)
    set_physical_attack(stats.physical_attack + 2)
    set_magic_attack(stats.magic_attack + 1)
    set_physical_defense(stats.physical_defense + 1)
    set_magic_defense(stats.magic_defense + 1)
    set_health(stats.max_health)
    set_mana(stats.max_mana)

## Verificar si el personaje está muerto
func is_dead() -> bool:
    return stats.health <= 0

## Ganar experiencia
func gain_experience(amount: float) -> void:
    set_experience(stats.experiencie + amount)
    if stats.experiencie >= stats.level * 100:
        level_up()

## Restablecer estadísticas
func reset_stats() -> void:
    set_health(stats.max_health)
    set_mana(stats.max_mana)
    set_corruption(0.0)
    set_is_corrupted(false)
    set_experience(0.0)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"""
DESP DE TODO ESO, CREAR ESCENA PARA PROBAR
LUEGO, MODIFICAR COMBATSCENE PARA QUE QUEDE BIEN ACORDE
FIN. 

"""


## Checkea si el usuario entra o sale de combate, y modifica sus stats para solo mantener la vida
## fuera del mismo
func in_combat(value: bool):
    if value: 
        combat_stats = stats
    else: 
        stats.health = combat_stats.health 
        combat_stats = stats

    
func recieve_damage(damage: int, type: Enums.DamageType, elemental_type : Enums.ElementalType):
    var checked_damage = check_element_affinity(elemental_type, damage)

    if type == Enums.DamageType.Magic:
        calculate_damage(checked_damage, combat_stats.magic_defense)
    elif type == Enums.DamageType.Physical:
        calculate_damage(checked_damage, combat_stats.physical_defense)
    elif type == Enums.DamageType.True:
        calculate_damage(checked_damage)
       
     
func calculate_damage(checked_damage, defense_type = null):
    if defense_type == null:
        combat_stats.health = (combat_stats.damage * checked_damage)/ ((combat_stats.magic_defense+combat_stats.physical_defense) / 5)
    else:
        combat_stats.health = (combat_stats.damage * checked_damage)/ defense_type
    
    
func check_element_affinity(elemental_type: Enums.ElementalType, damage: int) -> int:
    var element_affinity = ElementAffinity.new()
    var effectiveness = element_affinity.element_effectiveness(elemental_type, combat_stats.elemental_affinity)
    return int(damage * effectiveness)


func increase_corruption(value):
    combat_stats.corruption += value
    
func decrease_corruption(value):
    combat_stats.corruption -= value
    
func increase_damage(value, type):
    if type == Enums.DamageType.Magic:
        combat_stats.magic_defense += value
    elif type == Enums.DamageType.Physical:
        combat_stats.physical_defense += value

func decrease_damage(value, type):
    if type == Enums.DamageType.Magic:
        combat_stats.magic_defense -= value
    elif type == Enums.DamageType.Physical:
        combat_stats.physical_defense -= value
    
func increase_mana(value):
    combat_stats.mana += value
    
func decrease_mana(value):
    combat_stats.mana -= value
    
func increase_health(value):
    combat_stats.health += value
    
func decrease_health(value):
    combat_stats.health -= value
    
func increase_defense(value, type):
    if type == Enums.DefenseType.Magic:
        combat_stats.magic_defense += value
    elif type == Enums.DefenseType.Physical:
        combat_stats.physical_defense += value
    
func decrease_defense(value, type):
    if type == Enums.DefenseType.Magic:
        combat_stats.magic_defense -= value
    elif type == Enums.DefenseType.Physical:
        combat_stats.physical_defense -= value
    
func increase_speed(value):
    combat_stats.speed += value
    
func decrease_speed(value):
    combat_stats.speed -= value
    
func pass_turn(duration: int):
    combat_stats.turns_inactive = duration
    combat_stats.action_turn = false

func on_turn_start():
    if combat_stats.turns_inactive > 0:
        combat_stats.turns_inactive -= 1
        if combat_stats.turns_inactive == 0:
            combat_stats.action_turn = true
