class_name CharacterPlacement
extends Control



@onready var target_indicator: ColorRect = $VBoxContainer/TargetIndicator
@onready var combat_menu: CombatMenu = $CombatMenu

var attacks_menu
var items_menu
var skills_menu

var assigned_combatant: Node2D = null
var player: Node2D
var targeted : bool = false

var skills_name: Array
var items_name: Array
var attacks_name: Array


func _ready() -> void:
    player = CombatData.get_player_data()

func set_up() -> void: 
    get_menus()
    set_menus()

func get_combatant() -> Node2D:
    return assigned_combatant

func set_combatant(combatant):
    assigned_combatant = combatant
 
func get_player():
    return player 

func set_player(pj):
    player = pj  

    
func get_menus():
    for container in combat_menu.get_children():
        for menu in container.get_children():
            if menu.name == "AttacksMenu":
                attacks_menu = menu
            elif menu.name == "ItemsMenu":
                items_menu = menu
            elif menu.name == "SkillsMenu":
                skills_menu = menu
        
        
        
func set_menus():
    var skill_list : Array = get_menus_name("skills")
    var attack_list: Array = get_menus_name("attacks")  
    var item_list: Array = get_menus_name("items")  

    
    skills_name.clear()
    items_name.clear()
    attacks_name.clear()
    
    
    for skill in skill_list:
        print(skill)
        skills_name.append(skill["Name"])
    for attack in attack_list:
        attacks_name.append(attack["Name"])
    for item in item_list:
         items_name.append(item["Name"])
        
    
    set_button_texts(skills_menu, skills_name)

    
    set_button_texts(attacks_menu, attacks_name)

    
    set_button_texts(items_menu, items_name)


func set_button_texts(menu: Control, names: Array):
    """
    Asigna los nombres de habilidades, ataques o ítems a los botones dentro del menú dado.
    Oculta los botones vacíos y deja visible el botón 'Back'.
    
    :param menu: Nodo contenedor de los botones.
    :param names: Lista de nombres a asignar a los botones.
    """
    var index = 0

    for button in menu.get_children():
        print(button)  # Depuración: Ver qué botones encuentra
        if button is Button and button.name != "Back" and button.name != "Ascended":  
            if index < names.size():  
                button.text = names[index]  
                button.visible = true  
                index += 1
            else:
                button.visible = false  # Ocultar botones vacíos


    
    
    
func get_menus_name(type):
    var list : Array
    if type == "skills":
        list = player.get_combat_skills()
        print(list)
        return list
    elif type == "items":
        list = player.get_combat_attacks()
        return list
    elif type == "attacks":
        list = player.get_combat_items()
        return list
      
        
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
