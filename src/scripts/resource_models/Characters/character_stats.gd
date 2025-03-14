class_name CharacterStats
extends Resource


@export var name: String = ""
## Obtiene el nombre del personaje.
func get_char_name() -> String:
    return name

## Establece el nombre del personaje.
func set_char_name(value: String) -> void:
    name = value


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


@export var effect: Effect
func get_effect() -> Effect:
    return effect

func set_effect(value: Effect) -> void:
    effect = value



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
