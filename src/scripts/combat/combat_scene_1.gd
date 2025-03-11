class_name CombatScene
extends Control

@onready var background: TextureRect = $Background

@onready var ally_group_1: Node2D = $AllyMarkers/AllyGroup1
@onready var ally_group_2: Node2D = $AllyMarkers/AllyGroup2
@onready var boss: Node2D = $EnemyMarkers/Boss
@onready var enem_group_1: Node2D = $EnemyMarkers/EnemGroup1
@onready var enem_group_2: Node2D = $EnemyMarkers/EnemGroup2
@onready var enem_group_3: Node2D = $EnemyMarkers/EnemGroup3
@onready var combat_queue: CombatQueue = $CombatQueue
@onready var combat_manager: CombatManager = $CombatManager

var enemies: Array = []
var allies: Array = []
var player: Node2D

var enemy_group: Node2D
var ally_group: Node2D




func _ready() -> void:
     
    var combatant_data: Dictionary = CombatTransitioner.get_combat_data()
    select_combatants(combatant_data)
    placement_handler()
    #check_combatants(allies, enemies)
    
    
func select_combatants(combat_data: Dictionary):
    player = combat_data.get("player", null)
    allies = combat_data.get("allies", [])
    enemies = combat_data.get("enemies", [])
        
    
    
func placement_handler():
    var a_count: int = count_combatants("allies")
    var e_count: int = count_combatants("enemies")
    set_group_visible(true, a_count, e_count)
    set_combatants_in_place()
    
    

    

func count_combatants(group:String):
    if group == "allies":
        var ally_count := allies.size()
        return ally_count + 1 #el jugador es el +1
    elif group == "enemies":
        var enemy_count := enemies.size()
        return enemy_count
        
        
func set_group_visible(value: bool, a_count: int, e_count: int):
    
    ally_group = ally_group_1 if a_count == 1 else ally_group_2
    enemy_group = enem_group_1 if e_count == 1 else (enem_group_2 if e_count == 2 else enem_group_3)
    
    ally_group.set_visible(value)
    enemy_group.set_visible(value)

## Posiciona a los aliados y enemigos en sus posiciones adecuados. Solo su sprite. Luego deberan ser sus animaciones. 
func set_combatants_in_place():    
    var player_position
    var ally_position
    
    for children in ally_group.get_children():
        if children.name == "Player Placeholder":
            display_combatant(children, player)
        elif children.name == "Ally Placeholder":
            display_combatant(children, allies)  
            
    for children in enemy_group.get_children():
        display_combatant(children, enemies)
    
    combat_manager.combatant_set_up(player, allies, enemies, ally_group, enemy_group)
    combat_manager.create_queue()
    combat_manager.next_turn()




func display_combatant(group_child: Control, combatant):
    if combatant is Array:
        for c in combatant:
            group_child.set_combatant(c)
            get_combatant_hpbar(c, group_child)
            get_combatant_texture(c, group_child)
        
    else:  #player
        group_child.set_player(combatant)
        group_child.set_combatant(combatant)
        
        group_child.set_up()
        get_combatant_hpbar(combatant, group_child)
        get_combatant_texture(combatant, group_child)
        


func get_combatant_hpbar(combatant, group_child):
    for vbox in group_child.get_children():
        var hpbar: ProgressBar = vbox.get_node_or_null("Healthbar")
        if hpbar:
            set_initial_character_hpbar(hpbar, combatant)
        
    
func get_combatant_texture(combatant, group_child):
    for vbox in group_child.get_children():
        var txt_rect: TextureRect = vbox.get_node_or_null("TextureRect")
        
        if txt_rect:
            var char_sprite: Sprite2D = combatant.get_node_or_null("Sprite2D")
            if char_sprite and char_sprite.texture:
                
                txt_rect.texture = char_sprite.texture
                var dimensions = combatant.get_dimensions()
                
                txt_rect.custom_minimum_size = dimensions
                txt_rect.size = dimensions
                txt_rect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED


func set_initial_character_hpbar(hpbar : ProgressBar, combatant: Node2D):
    hpbar.max_value = combatant.stats.max_health
    hpbar.value = combatant.stats.health
    

    
"""

ToDo: 
    
EMPEZAR A TRABAJAR EN REALIZAR ACCIONES, Y MODIFICAR EL CODIGO DE ACCIONES


ACTUALIZAR EN TIEMPO REAL LA HPBAR.
CREAR UNA FUNCION QUE BUSQUE LA HPBAR Y GUARDE EL NODO. PARA LUEGO USARLA EN GET_CHAR_PLACEMENT Y LA FUNC QUE ACTUALICE LA HPBAR. 
TAMBIEN  UNA VEZ QUE ESTEN LAS ANIMACIONES, MODIFICAR TEXTURE RECT PARA QUE SEA UN ANIMATION PLAYER. 


EL

"""
