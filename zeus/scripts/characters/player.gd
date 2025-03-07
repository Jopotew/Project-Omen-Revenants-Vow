class_name CharacterPlayerModel
extends CharacterBody2D

@export var stats: CharacterStats

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

func set_corruption(value: float) -> void:
    stats.corruption = clamp(value, 0, 100)
    update_corruption_state()

## Multiplicador de corrupción
func get_corruption_multiplier() -> float:
    return stats.corruption_multiplier

func set_corruption_multiplier(value: float) -> void:
    stats.corruption_multiplier = value

## Resistencia
func get_resistance() -> float:
    return stats.resistance

func set_resistance(value: float) -> void:
    stats.resistance = value

## Si está corrompido
func get_is_corrupted() -> bool:
    return stats.is_corrupted

func set_is_corrupted(value: bool) -> void:
    stats.is_corrupted = value

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~🎮 Habilidades y Equipamiento~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

## Habilidades
func get_skills() -> Array:
    return stats.skills

func set_skills(value: Array) -> void:
    stats.skills = value

## Habilidades de combate
func get_combat_skills() -> Array:
    print(stats.combat_skills)
    return stats.combat_skills

func set_combat_skills(value: Array) -> void:
    stats.combat_skills = value

## Objetos
func get_items() -> Array:
    return stats.items

func set_items(value: Array) -> void:
    stats.items = value

#IMPLEMENTAR PARA HACER EL REMOVE DE ITEMS Y SKILLS ETC



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

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~📏 Tamaño en Escena de Combate~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

## Obtener dimensiones
func get_dimensions() -> Vector2:
    return Vector2(stats.width, stats.height)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~🛠️ Funciones de Juego~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

## Recibir daño físico
func receive_physical_damage(damage: float) -> void:
    var actual_damage = max(damage - stats.physical_defense, 0)
    set_health(stats.health - actual_damage)

## Recibir daño mágico
func receive_magic_damage(damage: float) -> void:
    var actual_damage = max(damage - stats.magic_defense, 0)
    set_health(stats.health - actual_damage)

## Usar magia
func use_magic(cost: float) -> bool:
    if stats.mana >= cost:
        set_mana(stats.mana - cost)
        return true
    return false

## Curar vida
func heal(amount: float) -> void:
    set_health(stats.health + amount)

## Aumentar la corrupción
func increase_corruption(amount: float) -> void:
    set_corruption(stats.corruption + amount)

## Actualizar estado de corrupción
func update_corruption_state() -> void:
    if stats.corruption >= 75:
        stats.is_corrupted = true
    else:
        stats.is_corrupted = false

## Usar una habilidad
func use_skill(skill: String) -> void:
    pass  # Implementar lógica de habilidades

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

## Obtener el daño total
func get_total_attack() -> float:
    return stats.physical_attack + stats.magic_attack

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
