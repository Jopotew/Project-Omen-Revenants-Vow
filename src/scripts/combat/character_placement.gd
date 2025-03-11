class_name CharacterPlacement
extends Control

@onready var combat_menu: CombatMenu = $CombatMenu

var assigned_combatant: Node2D = null
var player

func set_up(player) -> void:
    get_menus()
    update_combat_menu(player)

func get_combatant() -> Node2D:
    return assigned_combatant

func set_combatant(combatant):
    assigned_combatant = combatant
 
func get_player():
    return player 

func set_player(pj):
    player = pj

func get_menus():
    pass  # Ya no necesitamos obtener referencias manualmente

func update_combat_menu(player):
    """
    Obtiene los nombres de habilidades, ataques e ítems del jugador
    y los pasa a `CombatMenu` para que los actualice.
    """
    var skill_list: Array = get_menus_name("skills", player)
    var attack_list: Array = get_menus_name("attacks", player)
    var item_list: Array = get_menus_name("items", player)

    var skills_name = []
    var attacks_name = []
    var items_name = []

    for skill in skill_list:
        skills_name.append(skill.name)
    for attack in attack_list:
        attacks_name.append(attack.name)
    for item in item_list:
        items_name.append(item.name)

    # Llamar a `CombatMenu` para actualizar los botones
    combat_menu.update_menus(skills_name, attacks_name, items_name)

func get_menus_name(type, player):
    """
    Obtiene los nombres de habilidades, ataques o ítems según el tipo.
    """
    if type == "skills":
        return player.get_combat_skills()
    elif type == "attacks":
        return player.get_combat_attacks()
    elif type == "items":
        return player.get_combat_items()
    return []

    
    
