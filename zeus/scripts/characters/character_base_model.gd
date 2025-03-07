class_name CharacterBaseModel
extends Node

@export var stats: CharacterStats


# Getters y Setters para las estadísticas

# Nombre del personaje
func get_char_name() -> String:
    return stats.name

func set_char_name(value: String) -> void:
    stats.name = value

# Salud
func get_health() -> int:
    return stats.health

func set_health(value: int) -> void:
    stats.health = value
    stats.health = clamp(stats.health, 0, stats.max_health)

# Mana
func get_mana() -> int:
    return stats.mana

func set_mana(value: int) -> void:
    stats.mana = value
    stats.mana = clamp(stats.mana, 0, stats.max_mana)

# Nivel
func get_level() -> int:
    return stats.level

func set_level(value: int) -> void:
    stats.level = value

# Experiencia
func get_experience() -> float:
    return stats.experiencie

func set_experience(value: float) -> void:
    stats.experiencie = value

# Multiplicador de experiencia
func get_exp_multiplier() -> float:
    return stats.exp_multiplier

func set_exp_multiplier(value: float) -> void:
    stats.exp_multiplier = value

# Velocidad
func get_speed() -> int:
    return stats.speed

func set_speed(value: int) -> void:
    stats.speed = value

# Salud máxima
func get_max_health() -> int:
    return stats.max_health

func set_max_health(value: int) -> void:
    stats.max_health = value
    stats.health = clamp(stats.health, 0, stats.max_health)

# Ataque físico
func get_physical_attack() -> float:
    return stats.physical_attack

func set_physical_attack(value: float) -> void:
    stats.physical_attack = value

# Ataque mágico
func get_magic_attack() -> float:
    return stats.magic_attack

func set_magic_attack(value: float) -> void:
    stats.magic_attack = value

# Mana máximo
func get_max_mana() -> int:
    return stats.max_mana

func set_max_mana(value: int) -> void:
    stats.max_mana = value
    stats.mana = clamp(stats.mana, 0, stats.max_mana)

# Defensa física
func get_physical_defense() -> float:
    return stats.physical_defense

func set_physical_defense(value: float) -> void:
    stats.physical_defense = value

# Defensa mágica
func get_magic_defense() -> float:
    return stats.magic_defense

func set_magic_defense(value: float) -> void:
    stats.magic_defense = value

# Corrupción
func get_corruption() -> float:
    return stats.corruption

func set_corruption(value: float) -> void:
    stats.corruption = value
    stats.corruption = clamp(stats.corruption, 0, 100)
    update_corruption_state()

# Multiplicador de corrupción
func get_corruption_multiplier() -> float:
    return stats.corruption_multiplier

func set_corruption_multiplier(value: float) -> void:
    stats.corruption_multiplier = value

# Resistencia
func get_resistance() -> float:
    return stats.resistance

func set_resistance(value: float) -> void:
    stats.resistance = value

# Si está corrompido
func get_is_corrupted() -> bool:
    return stats.is_corrupted

func set_is_corrupted(value: bool) -> void:
    stats.is_corrupted = value

# Si está vivo
func get_is_alive() -> bool:
    return stats.is_alive

func set_is_alive(value: bool) -> void:
    stats.is_alive = value

# Si es controlable
func get_is_controllable() -> bool:
    return stats.is_controllable

func set_is_controllable(value: bool) -> void:
    stats.is_controllable = value

# Si el personaje tiene turno
func get_action_turn() -> bool:
    return stats.action_turn

func set_action_turn(value: bool) -> void:
    stats.action_turn = value

#Dimensiones

# Función para obtener las dimensiones del personaje en la escena de combate
func get_dimensions() -> Vector2:
    return Vector2(stats.width, stats.height)


# Habilidades
func get_skills() -> Array:
    return stats.skills

func set_skills(value: Array) -> void:
    stats.skills = value


# Función para recibir daño físico
func receive_physical_damage(damage: float) -> void:
    var actual_damage = max(damage - stats.physical_defense, 0) # La armadura reduce el daño
    stats.health -= actual_damage
    stats.health = clamp(stats.health, 0, stats.max_health) # Limita la vida a no menos de 0 ni más de max_health

# Función para recibir daño mágico
func receive_magic_damage(damage: float) -> void:
    var actual_damage = max(damage - stats.magic_defense, 0) # Resistencia a magia
    stats.health -= actual_damage
    stats.health = clamp(stats.health, 0, stats.max_health)

# Función para usar magia
func use_magic(cost: float) -> bool:
    if stats.mana >= cost:
        stats.mana -= cost
        return true
    return false

# Función para curar vida
func heal(amount: float) -> void:
    stats.health += amount
    stats.health = clamp(stats.health, 0, stats.max_health)

# Función para aumentar la corrupción
func increase_corruption(amount: float) -> void:
    stats.corruption += amount
    stats.corruption = clamp(stats.corruption, 0, 100)
    update_corruption_state()

# Función para actualizar el estado de corrupción
func update_corruption_state() -> void:
    if stats.corruption >= 75:
        stats.is_corrupted = true
    elif stats.corruption >= 50:
        stats.is_corrupted = false # Puede ser modificado según los efectos específicos
    else:
        stats.is_corrupted = false

# Función para usar una habilidad
func use_skill(skill: String) -> void:
    # Aquí irían las acciones de cada habilidad
    # Implementar habilidades específicas
    pass

# Función para subir de nivel
func level_up() -> void:
    stats.level += 1
    stats.max_health += 10
    stats.max_mana += 5
    stats.physical_attack += 2
    stats.magic_attack += 1
    stats.magic_defense += 1
    stats.physical_defense += 1
    stats.health = stats.max_health
    stats.mana = stats.max_mana

# **Nuevas Funciones Adicionales**
# Función para verificar si el personaje está muerto
func is_dead() -> bool:
    return stats.health <= 0

# Función para obtener el daño total (físico y mágico)
func get_total_attack() -> float:
    return stats.physical_attack + stats.magic_attack

# Función para calcular la experiencia ganada
func gain_experience(amount: float) -> void:
    stats.experiencie += amount
    if stats.experiencie >= stats.level * 100:  # Suponiendo que se necesita 100 XP por nivel
        level_up()

# Función para restablecer las estadísticas del personaje
func reset_stats() -> void:
    stats.health = stats.max_health
    stats.mana = stats.max_mana
    stats.corruption = 0.0
    stats.is_corrupted = false
    stats.experiencie = 0.0
