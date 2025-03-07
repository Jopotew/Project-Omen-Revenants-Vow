class_name CharacterStats
extends Resource

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~📌 Identidad y Nivel~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
@export var name: String = ""
@export var level: int = 1
@export var experiencie: float = 0.0
@export var exp_multiplier: float = 1.0

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~⚔️ Atributos de Combate~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
@export var health: int = 100
@export var max_health: int = 100
@export var mana: int = 50
@export var max_mana: int = 50

@export var physical_attack: int = 10
@export var magic_attack: int = 5
@export var physical_defense: int = 5
@export var magic_defense: int = 0
@export var speed: int = 15

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~🕵️ Estado y Condiciones~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
@export var is_alive: bool = true
@export var is_controllable: bool = false
@export var action_turn: bool = false

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~👁️‍🗨️ Corrupción y Resistencias~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
@export var corruption: float = 0.0
@export var corruption_multiplier: float = 0.0
@export var resistance: float = 0.0
@export var is_corrupted: bool = false
@export var status_effect: Dictionary
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~🎮 Habilidades y Equipamiento~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
@export var skills: Array = [
    {"Name": "FireBall", "Damage": 30, "Effect": "Burn"},
    {"Name": "Ice Spike", "Damage": 20, "Effect": "Freeze"}
]
@export var combat_skills: Array = [
    {"Name": "FireBall", "Damage": 30, "Effect": "Burn"},
    {"Name": "Ice Spike", "Damage": 20, "Effect": "Freeze"}
]
@export var items: Array
@export var combat_items: Array
@export var combat_attacks: Array

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~📏 Tamaño en Escena de Combate~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
@export var width: int = 64  # Ancho del personaje en la escena de combate
@export var height: int = 128  # Altura del personaje en la escena de combate
