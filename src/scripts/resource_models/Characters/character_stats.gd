class_name CharacterStats
extends Resource


@export var name: String = ""
## Obtiene el nombre del personaje.
func get_char_name() -> String:
    return name

## Establece el nombre del personaje.
func set_char_name(value: String) -> void:
    name = value
    
@export var character_role: Enums.CharacterRole

@export var character_element: Enums.ElementalType


@export var level: int = 1
## Obtiene el nivel del personaje.
func get_level() -> int:
    return level

## Establece el nivel del personaje.
func set_level(value: int) -> void:
    level = value


@export var experiencie: float = 0.0
## Obtiene la experiencia del personaje.
func get_experience() -> float:
    return experiencie

## Establece la experiencia del personaje.
func set_experience(value: float) -> void:
    experiencie = value


@export var exp_multiplier: float = 1.0
## Obtiene el multiplicador de experiencia.
func get_exp_multiplier() -> float:
    return exp_multiplier

## Establece el multiplicador de experiencia.
func set_exp_multiplier(value: float) -> void:
    exp_multiplier = value


@export var is_controllable: bool = false
## Obtiene si el personaje es controlable.
func get_is_controllable() -> bool:
    return is_controllable

## Establece si el personaje es controlable.
func set_is_controllable(value: bool) -> void:
    is_controllable = value


@export var health: int = 100
## Obtiene la salud actual.
func get_health() -> int:
    return health

## Establece la salud del personaje dentro de los límites permitidos.
func set_health(value: int) -> void:
    # Ajusta el valor según tu lógica (por ejemplo, clamp)
    health = value


@export var max_health: int = 100
## Obtiene la salud máxima.
func get_max_health() -> int:
    return max_health

## Establece la salud máxima y ajusta la salud actual si es necesario.
func set_max_health(value: int) -> void:
    max_health = value
    if health > max_health:
        health = max_health

@export var speed: int = 10
## Obtiene la velocidad del personaje.
func get_speed() -> int:
    return speed

## Establece la velocidad del personaje.
func set_speed(value: int) -> void:
    speed = value

@export var mana: int = 50
## Obtiene el mana actual.
func get_mana() -> int:
    return mana

## Establece el mana, asegurando que no sea negativo ni supere el máximo.
func set_mana(value: int) -> void:
    mana = value


@export var max_mana: int = 50
## Obtiene el mana máximo.
func get_max_mana() -> int:
    return max_mana

## Establece el mana máximo y ajusta el mana actual si es necesario.
func set_max_mana(value: int) -> void:
    max_mana = value
    if mana > max_mana:
        mana = max_mana


@export var physical_attack: int = 10
## Obtiene el ataque físico.
func get_physical_attack() -> int:
    return physical_attack

## Establece el ataque físico.
func set_physical_attack(value: int) -> void:
    physical_attack = value


@export var attack_accuracy: int = 90
## Obtiene la precisión del ataque.
func get_attack_accuracy() -> int:
    return attack_accuracy

## Establece la precisión del ataque.
func set_attack_accuracy(value: int) -> void:
    attack_accuracy = value


@export var magic_attack: int = 5
func get_magic_attack() -> int:
    return magic_attack

func set_magic_attack(value: int) -> void:
    magic_attack = value


@export var crit_chance: float
func get_crit_chance() -> float:
    return crit_chance

func set_crit_chance(value: float) -> void:
    crit_chance = value


@export var physical_defense: int = 5
func get_physical_defense() -> int:
    return physical_defense

func set_physical_defense(value: int) -> void:
    physical_defense = value


@export var magic_defense: int = 0
func get_magic_defense() -> int:
    return magic_defense

func set_magic_defense(value: int) -> void:
    magic_defense = value


@export var affected_by_effect: bool = false
func get_affected_by_effect() -> bool:
    return affected_by_effect

func set_affected_by_effect(value: bool) -> void:
    affected_by_effect = value


@export var effects_applied: Array[Effect]
func get_effect() -> Array:
    return effects_applied

func set_effect(value: Effect) -> void:
    effects_applied.append(value)

func effect_turns_left(target):
    for effect in effects_applied:
        if effect.duration == 0:
            remove_effect(effect)
        else:
            effect.duration -= 1
            effect.apply(target)
            

func remove_effect(effect):
    effects_applied.erase(effect)


@export var corruption: int = 0
func get_corruption() -> int:
    return corruption

func set_corruption(value: int) -> void:
    corruption = value


@export var corruption_multiplier: int = 0
func get_corruption_multiplier() -> int:
    return corruption_multiplier

func set_corruption_multiplier(value: int) -> void:
    corruption_multiplier = value


@export var resistance_to_corruption: int = 0
func get_corruption_resistance() -> int:
    return resistance_to_corruption

func set_corruption_resistance(value: int) -> void:
    resistance_to_corruption = value


@export var is_corrupted: bool = false
func get_is_corrupted() -> bool:
    return is_corrupted

func set_is_corrupted(value: bool) -> void:
    is_corrupted = value


@export var width: int = 64
func get_width() -> int:
    return width

func set_width(value: int) -> void:
    width = value


@export var height: int = 128
func get_height() -> int:
    return height

func set_height(value: int) -> void:
    height = value

## Obtiene las dimensiones del personaje en la escena de combate.
func get_dimensions() -> Vector2:
    return Vector2(width, height)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## Sube de nivel al personaje y mejora sus estadísticas.
func level_up() -> void:
    set_level(level + 1)
    set_max_health(max_health + 10)
    set_max_mana(max_mana + 5)
    set_physical_attack(physical_attack + 2)
    set_magic_attack(magic_attack + 1)
    set_physical_defense(physical_defense + 1)
    set_magic_defense(magic_defense + 1)
    set_health(max_health)
    set_mana(max_mana)
    
    
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## Recibe daño considerando el tipo y la afinidad elemental.
func recieve_damage(damage: int, type: Enums.DamageType, elemental_type: Enums.ElementalType):
    var checked_damage = check_element_affinity(elemental_type, damage)
    
    if type == Enums.DamageType.Magic:
        return calculate_damage(checked_damage, magic_defense)
        
    elif type == Enums.DamageType.Physical:
        return calculate_damage(checked_damage, physical_defense)
    else:
        return calculate_damage(checked_damage)
        

## Calcula el daño recibido en base a la defensa del personaje.
func calculate_damage(checked_damage, defense_type = null):
    
    if checked_damage == 0:
        checked_damage = 1
    if defense_type == 0:
        defense_type = 1
        
 
    if defense_type == null:
        health -= checked_damage
        return checked_damage
    
    else:
        health -= max(1, checked_damage / defense_type)
        return max(1, checked_damage / defense_type)

## Modifica el daño basado en la afinidad elemental.
func check_element_affinity(elemental_type: Enums.ElementalType, damage: int) -> int:
    var element_affinity = ElementAffinity.new()
    var effectiveness = element_affinity.element_effectiveness(elemental_type, character_element)
    return int(damage * effectiveness)

## Reduce la salud del personaje.
func decrease_health(value: int):
    health = max(0, health - value)

## Aumenta la salud del personaje sin exceder el máximo.
func increase_health(value: int):
    health = min(max_health, health + value)


## Reduce el maná del personaje.
func decrease_mana(value: int):
    mana = max(0, mana - value)

## Aumenta el maná del personaje sin exceder el máximo.
func increase_mana(value: int):
    mana = min(max_mana, mana + value)


## Reduce la velocidad del personaje.
func decrease_speed(value: int):
    speed = max(0, speed - value)

## Aumenta la velocidad del personaje.
func increase_speed(value: int):
    speed += value


## Reduce el ataque físico del personaje.
func decrease_physical_attack(value: int):
    physical_attack = max(0, physical_attack - value)

## Aumenta el ataque físico del personaje.
func increase_physical_attack(value: int):
    physical_attack += value


## Reduce la precisión del ataque del personaje.
func decrease_attack_accuracy(value: int):
    attack_accuracy = max(0, attack_accuracy - value)

## Aumenta la precisión del ataque del personaje.
func increase_attack_accuracy(value: int):
    attack_accuracy = min(100, attack_accuracy + value)  # Máximo 100% de precisión


## Reduce el ataque mágico del personaje.
func decrease_magic_attack(value: int):
    magic_attack = max(0, magic_attack - value)

## Aumenta el ataque mágico del personaje.
func increase_magic_attack(value: int):
    magic_attack += value


## Reduce la probabilidad de crítico del personaje.
func decrease_crit_chance(value: float):
    crit_chance = max(0, crit_chance - value)

## Aumenta la probabilidad de crítico del personaje sin exceder el 100%.
func increase_crit_chance(value: float):
    crit_chance = min(100, crit_chance + value)


## Modifica el ataque del personaje según el tipo (FÍSICO o MÁGICO)
func increase_attack(value: int, type: Enums.DamageType):
    match type:
        Enums.DamageType.Physical:
            physical_attack += value
        Enums.DamageType.Magic:
            magic_attack += value

func decrease_attack(value: int, type: Enums.DamageType):
    match type:
        Enums.DamageType.Physical:
            physical_attack = max(0, physical_attack - value)
        Enums.DamageType.Magic:
            magic_attack = max(0, magic_attack - value)


## Modifica la defensa del personaje según el tipo (FÍSICA o MÁGICA)
func increase_defense(value: int, type: Enums.DefenseType):
    match type:
        Enums.DefenseType.Physical:
            physical_defense += value
        Enums.DefenseType.Magic:
            magic_defense += value

func decrease_defense(value: int, type: Enums.DefenseType):
    match type:
        Enums.DefenseType.Physical:
            physical_defense = max(0, physical_defense - value)
        Enums.DefenseType.Magic:
            magic_defense = max(0, magic_defense - value)



## Reduce la corrupción del personaje.
func decrease_corruption(value: int):
    corruption = max(0, corruption - value)

## Aumenta la corrupción del personaje.
func increase_corruption(value: int):
    corruption += value


## Reduce el multiplicador de corrupción.
func decrease_corruption_multiplier(value: int):
    corruption_multiplier = max(0, corruption_multiplier - value)

## Aumenta el multiplicador de corrupción.
func increase_corruption_multiplier(value: int):
    corruption_multiplier += value


## Reduce la resistencia a la corrupción del personaje.
func decrease_corruption_resistance(value: int):
    resistance_to_corruption = max(0, resistance_to_corruption - value)

## Aumenta la resistencia a la corrupción del personaje.
func increase_corruption_resistance(value: int):
    resistance_to_corruption += value
