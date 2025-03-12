class_name NpcCharacterModel
extends Node2D


@export var stats: CharacterStats
var combat_stats: CharacterStats


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~📌 Identidad y Nivel~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

## Obtiene el nombre del personaje.
func get_char_name() -> String:
    return stats.name

## Establece el nombre del personaje.
func set_char_name(value: String) -> void:
    stats.name = value

## Obtiene el nivel del personaje.
func get_level() -> int:
    return stats.level

## Establece el nivel del personaje.
func set_level(value: int) -> void:
    stats.level = value

## Obtiene la experiencia del personaje.
func get_experience() -> float:
    return stats.experience

## Establece la experiencia del personaje.
func set_experience(value: float) -> void:
    stats.experience = value

## Obtiene el multiplicador de experiencia.
func get_exp_multiplier() -> float:
    return stats.exp_multiplier

## Establece el multiplicador de experiencia.
func set_exp_multiplier(value: float) -> void:
    stats.exp_multiplier = value

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~⚔️ Atributos de Combate~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

## Obtiene la salud actual.
func get_health() -> int:
    return stats.health

## Establece la salud del personaje dentro de los límites permitidos.
func set_health(value: int) -> void:
    stats.health = clamp(value, 0, stats.max_health)

## Obtiene la salud máxima.
func get_max_health() -> int:
    return stats.max_health

## Establece la salud máxima y ajusta la salud actual si es necesario.
func set_max_health(value: int) -> void:
    stats.max_health = value
    stats.health = clamp(stats.health, 0, stats.max_health)

## Obtiene el mana actual.
func get_mana() -> int:
    return stats.mana

## Establece el mana, asegurando que no sea negativo ni supere el máximo.
func set_mana(value: int) -> void:
    stats.mana = clamp(value, 0, stats.max_mana)

## Obtiene el mana máximo.
func get_max_mana() -> int:
    return stats.max_mana

## Establece el mana máximo y ajusta el mana actual si es necesario.
func set_max_mana(value: int) -> void:
    stats.max_mana = value
    stats.mana = clamp(stats.mana, 0, stats.max_mana)

## Obtiene el ataque físico.
func get_physical_attack() -> float:
    return stats.physical_attack

## Establece el ataque físico.
func set_physical_attack(value: float) -> void:
    stats.physical_attack = value

## Obtiene el ataque mágico.
func get_magic_attack() -> float:
    return stats.magic_attack

## Establece el ataque mágico.
func set_magic_attack(value: float) -> void:
    stats.magic_attack = value

## Obtiene la precisión del ataque.
func get_attack_accuracy() -> int:
    return stats.attack_accuracy

## Establece la precisión del ataque.
func set_attack_accuracy(value: int) -> void:
    stats.attack_accuracy = value

## Obtiene si el personaje está afectado por un efecto.
func get_affected_by_effect() -> bool:
    return stats.affected_by_effect

## Establece si el personaje está afectado por un efecto.
func set_affected_by_effect(value: bool) -> void:
    stats.affected_by_effect = value

## Obtiene el efecto actual aplicado al personaje.
func get_effect() -> Effect:
    return stats.effect

## Establece un efecto en el personaje.
func set_effect(value: Effect) -> void:
    stats.effect = value

## Obtiene la defensa física.
func get_physical_defense() -> float:
    return stats.physical_defense

## Establece la defensa física.
func set_physical_defense(value: float) -> void:
    stats.physical_defense = value

## Obtiene la defensa mágica.
func get_magic_defense() -> float:
    return stats.magic_defense

## Establece la defensa mágica.
func set_magic_defense(value: float) -> void:
    stats.magic_defense = value

## Obtiene la velocidad del personaje.
func get_speed() -> int:
    return stats.speed

## Establece la velocidad del personaje.
func set_speed(value: int) -> void:
    stats.speed = value

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~🕵️ Estado y Condiciones~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

## Verifica si el personaje está vivo.
func get_is_alive() -> bool:
    return stats.is_alive

## Establece si el personaje está vivo.
func set_is_alive(value: bool) -> void:
    stats.is_alive = value

## Verifica si el personaje es controlable.
func get_is_controllable() -> bool:
    return stats.is_controllable

## Establece si el personaje es controlable.
func set_is_controllable(value: bool) -> void:
    stats.is_controllable = value

## Verifica si el personaje tiene turno.
func get_action_turn() -> bool:
    return stats.action_turn

## Establece si el personaje tiene turno.
func set_action_turn(value: bool) -> void:
    stats.action_turn = value

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~👁️‍🗨️ Corrupción y Resistencias~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

## Obtiene el nivel de corrupción del personaje.
func get_corruption() -> float:
    return stats.corruption

## Establece el nivel de corrupción del personaje.
func set_corruption(value: int) -> void:
    stats.corruption = value

## Obtiene el multiplicador de corrupción.
func get_corruption_multiplier() -> float:
    return stats.corruption_multiplier

## Establece el multiplicador de corrupción.
func set_corruption_multiplier(value: float) -> void:
    stats.corruption_multiplier = value

## Obtiene la resistencia a la corrupción.
func get_corruption_resistance() -> float:
    return stats.resistance_to_corruption

## Establece la resistencia a la corrupción.
func set_resistance(value: float) -> void:
    stats.resistance_to_corruption = value

## Verifica si el personaje está corrompido.
func get_is_corrupted() -> bool:
    return stats.is_corrupted

## Establece si el personaje está corrompido.
func set_is_corrupted(value: bool) -> void:
    stats.is_corrupted = value

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~🎮 Habilidades y Equipamiento~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

## Obtiene la lista de habilidades del personaje.
func get_skills() -> Array[Ability]:
    return stats.skills

## Agrega una nueva habilidad a la lista del personaje.
func set_skills(value: Ability) -> void:
    stats.skills.append(value)

## Obtiene las habilidades de combate.
func get_combat_skills() -> Array:
    return stats.combat_skills

## Establece las habilidades de combate.
func set_combat_skills(value: Array) -> void:
    stats.combat_skills = value

## Obtiene la lista de ítems del personaje.
func get_items() -> Array:
    return stats.items

## Establece la lista de ítems del personaje.
func set_items(value) -> void:
    stats.items = value

## Elimina un ítem específico del inventario del personaje.
func remove_item(item_rem):
    for item in stats.items:
        if item.name == item_rem.name:
            stats.items.erase(item)

## Elimina un ítem específico del inventario de combate.
func remove_combat_item(item_rem):
    for item in stats.combat_items:
        if item.name == item_rem.name:
            stats.combat_items.erase(item)

## Vacía la lista de ítems del personaje.
func clear_items():
    stats.items.clear()

## Vacía la lista de ítems de combate.
func clear_combat_items():
    stats.combat_items.clear()

## Obtiene los ítems de combate.
func get_combat_items() -> Array:
    return stats.combat_items

## Establece los ítems de combate.
func set_combat_items(value: Array) -> void:
    stats.combat_items = value

## Obtiene los ataques de combate.
func get_combat_attacks() -> Array:
    return stats.combat_attacks

## Establece los ataques de combate.
func set_combat_attacks(value: Array) -> void:
    stats.combat_attacks = value

## Obtiene las acciones disponibles según el tipo indicado.
func get_actions(action_type: String) -> Array:
    match action_type:
        "skills":
            return get_combat_skills()
        "items":
            return get_combat_items()
        "attacks":
            return get_combat_attacks()
        _:
            return []

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~📏 Tamaño en Escena de Combate~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

## Obtiene las dimensiones del personaje en la escena de combate.
func get_dimensions() -> Vector2:
    return Vector2(stats.width, stats.height)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~🛠️ Funciones de Juego~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

## Sube de nivel al personaje y mejora sus estadísticas.
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

## Verifica si el personaje está muerto.
func is_dead() -> bool:
    return stats.health <= 0

## Aumenta la experiencia del personaje y verifica si sube de nivel.
func gain_experience(amount: float) -> void:
    set_experience(stats.experience + amount)
    if stats.experience >= stats.level * 100:
        level_up()

## Restablece las estadísticas del personaje.
func reset_stats() -> void:
    set_health(stats.max_health)
    set_mana(stats.max_mana)
    set_corruption(0.0)
    set_is_corrupted(false)
    set_experience(0.0)

## Gestiona la entrada y salida del personaje en combate.
func in_combat(value: bool):
    if value:
        stats.in_combat = true
        combat_stats = stats
    else:
        stats.health = combat_stats.health
        stats.in_combat = false
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

## Pasa el turno del personaje por una cantidad específica de rondas.
func pass_turn(duration: int):
    combat_stats.turns_inactive = duration
    combat_stats.action_turn = false

## Maneja el inicio de turno del personaje.
func on_turn_start():
    if combat_stats.turns_inactive > 0:
        combat_stats.turns_inactive -= 1
        if combat_stats.turns_inactive == 0:
            combat_stats.action_turn = true


func execute_action(target):
    self_hp_treshhold()
    
    
func self_hp_treshhold():
    var actions = 1
    if combat_stats.health > (combat_stats.max_health * 0.75):
        high_health_actions()
        
    elif  combat_stats.health > (combat_stats.max_health * 0.5):
        medium_health_actions()
    
    elif combat_stats.health > (combat_stats.max_health * 0.25):
        low_health_actions()
        
    elif combat_stats.health < (combat_stats.max_health * 0.25):
        very_low_health_actions()
        
    else:
        print("raro que pase esto . no deberia pasar hpTreshhold")
        
    
  
func target_hp_treshold():
    pass  
    
func low_health_actions():
    var prob = random_number()

func very_low_health_actions():
    var prob = random_number()
    
func high_health_actions():
    var prob = random_number()
        
func medium_health_actions():
    var prob = random_number()


func random_number():
    return randi_range(1, 100)
