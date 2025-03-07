extends Resource
class_name Effect

# ==============================
# 🔹 BASIC INFORMATION
# ==============================

## The name of the effect (e.g., "Burn", "Poison", "Regeneration").
@export var name: String = "Unnamed Effect"

## A short description of what the effect does.
@export var description: String = "No description"

## Type of effect: "Buff" (positive) or "Debuff" (negative).
@export var effect_type: String = "Debuff"

# ==============================
# 🔹 HEALTH MODIFIERS
# ==============================

## The amount of damage dealt per turn (used for Poison, Burn, etc.).
@export var damage_per_turn: int = 0

## The amount of healing per turn (used for Regeneration, Holy Blessing, etc.).
@export var healing_per_turn: int = 0

## Multiplier for max health (e.g., 1.2 = +20% max health, 0.8 = -20%).
@export var max_health_mod: float = 1.0

# ==============================
# 🔹 MANA MODIFIERS
# ==============================

## Multiplier for mana (e.g., 1.2 = +20% max mana, 0.8 = -20%).
@export var mana_mod: float = 1.0

## Amount of mana regenerated per turn.
@export var mana_regen_per_turn: int = 0

## Amount of mana lost per turn.
@export var mana_reave: int = 0

# ==============================
# 🔹 ATTACK MODIFIERS
# ==============================

## Multiplier for physical attack (e.g., 1.5 = +50%, 0.5 = -50%).
@export var physical_attack_mod: float = 1.0

## Multiplier for magic attack.
@export var magic_attack_mod: float = 1.0

# ==============================
# 🔹 DEFENSE MODIFIERS
# ==============================

## Multiplier for physical defense.
@export var physical_defense_mod: float = 1.0

## Multiplier for magic defense.
@export var magic_defense_mod: float = 1.0

# ==============================
# 🔹 SPEED & ACTION MODIFIERS
# ==============================

## Multiplier for speed.
@export var speed_mod: float = 1.0

## If true, the effect grants an extra turn.
@export var action_turn_mod: bool = false

# ==============================
# 🔹 CORRUPTION & RESISTANCE MODIFIERS
# ==============================

## Multiplier for corruption gain.
@export var corruption_mod: float = 1.0

## Multiplier for resistance against corruption.
@export var corruption_resistance_mod: float = 1.0

## If true, the effect marks the character as corrupted.
@export var is_corrupted: bool = false

# ==============================
# 🔹 DURATION & STACKING
# ==============================

## Number of turns the effect lasts.
@export var duration: int = 1

## If true, the effect can stack multiple times.
@export var stacks: bool = false

## Maximum number of times this effect can stack.
@export var max_stacks: int = 1

# ==============================
# 🔹 REMOVAL CONDITIONS
# ==============================

## If true, the effect can be removed with an item or ability.
@export var removable: bool = true

## Conditions that remove the effect (e.g., ["Water Spell", "Holy Light"]).
@export var removal_conditions: Array = []
