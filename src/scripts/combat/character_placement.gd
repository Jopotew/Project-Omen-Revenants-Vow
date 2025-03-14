class_name CharacterPlacement
extends Control

@onready var combat_menu: CombatMenu = $CombatMenu

var assigned_combatant: Node2D = null
var player: Node2D  

func set_up(new_player: Node2D) -> void:
    update_combat_menu(new_player)

func get_combatant() -> Node2D:
    return assigned_combatant

func set_combatant(combatant: Node2D) -> void:
    assigned_combatant = combatant
 
func get_player() -> Node2D:
    return player 

func set_player(new_player: Node2D) -> void:
    player = new_player

func update_combat_menu(p_player: Node2D) -> void:
    """
    Obtiene los nombres de habilidades, ataques e ítems del jugador
    y los pasa a `CombatMenu` para que los actualice.
    """
    var skills_name: Array = get_menus_name("skills", p_player).map(func(skill): return skill.name)
    var attacks_name: Array = get_menus_name("attacks", p_player).map(func(attack): return attack.name)
    var items_name: Array = get_menus_name("items", p_player).map(func(item): return item.name)

    combat_menu.update_menus(skills_name, attacks_name, items_name)

func get_menus_name(type: String, p_player: Node2D) -> Array:
    """
    Obtiene los nombres de habilidades, ataques o ítems según el tipo.
    """
    match type:
        "skills":
            return p_player.battle_conditions.get_combat_skills()
        "attacks":
            return p_player.battle_conditions.get_combat_attacks()
        "items":
            return p_player.battle_conditions.get_combat_items()
        _:
            return []
