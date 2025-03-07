extends Resource
class_name StatusEffect

# ==============================
# 🔹 BASIC INFORMATION
# ==============================

## The name of the status effect (e.g., "Stun", "Fear", "Confusion").
@export var name: String = "Unnamed Status"

## A short description of what the status effect does.
@export var description: String = "No description"

## Type of status: "Buff" (positive) or "Debuff" (negative).
@export var status_type: String = "Debuff"

# ==============================
# 🔹 ACTION MODIFIERS
# ==============================

## If true, the character cannot take actions (used for Stun, Sleep, etc.).
@export var prevents_action: bool = false

## If true, the character cannot move (used for Rooted, Frozen, etc.).
@export var prevents_movement: bool = false

## If set, forces the character to take a specific action (e.g., "Flee", "Attack Ally").
@export var forced_action: String = ""

## Chance that the character will perform a random action instead of their choice (used for Confusion).
@export var random_action_chance: float = 0.0

# ==============================
# 🔹 CONTROL MODIFIERS
# ==============================

## If true, the character is controlled by the enemy or AI (e.g., Possession).
@export var loses_control: bool = false

## If true, the character will lose their turn automatically.
@export var skips_turn: bool = false

# ==============================
# 🔹 COMBAT MODIFIERS
# ==============================

## Multiplier for accuracy (e.g., 0.5 = -50% accuracy due to blindness).
@export var accuracy_mod: float = 1.0

## Multiplier for evasion (e.g., 0.7 = -30% evasion due to paralysis).
@export var evasion_mod: float = 1.0

## Multiplier for critical hit chance.
@export var critical_hit_mod: float = 1.0

# ==============================
# 🔹 DURATION & STACKING
# ==============================

## Number of turns the status effect lasts.
@export var duration: int = 1

## If true, the status effect can stack.
@export var stacks: bool = false

## Maximum number of times this status effect can stack.
@export var max_stacks: int = 1

# ==============================
# 🔹 REMOVAL CONDITIONS
# ==============================

## If true, the status effect can be removed with an item or ability.
@export var removable: bool = true

## Conditions that remove the status effect (e.g., ["Antidote", "Holy Light"]).
@export var removal_conditions: Array = []
