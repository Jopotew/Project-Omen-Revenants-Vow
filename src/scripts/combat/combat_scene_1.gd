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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    #
    #for i in range(CombatData.allies.size()):
        #allies.append(CombatData.allies[i].instantiate())
        #combat_queue.add_to_queue(CombatData.allies[i].instantiate()) 
#
    #for i in range(CombatData.enemies.size()):
        #enemies.append(CombatData.enemies[i].instantiate())
        #combat_queue.add_to_queue(CombatData.enemies[i].instantiate())  
    #
    #
    #check_combatants(allies, enemies)
    
    
    
    
    
    
    
    
func select_combatants(combat_data: Dictionary):
    player = combat_data.get("player", null)
    allies = combat_data.get("allies", [])
    enemies = combat_data.get("enemies", [])
    print(combat_data)
    print(player)
    print(allies)
    print(enemies)
    
    
    
    
    
    
    
    
    
    
    

    

func check_combatants(allies: Array, enemies: Array):
    var ally_count := allies.size()
    var enemy_count := enemies.size()
    set_combatants_in_place(ally_count, enemy_count, allies, enemies)

## Posiciona a los aliados y enemigos en sus posiciones adecuados. Solo su sprite. Luego deberan ser sus animaciones. 
func set_combatants_in_place(ally_count: int, enemy_count: int, allies: Array, enemies: Array):
    
    ally_group = ally_group_1 if ally_count == 1 else ally_group_2
    enemy_group = enem_group_1 if enemy_count == 1 else (enem_group_2 if enemy_count == 2 else enem_group_3)
    
    ally_group.set_visible(true)
    enemy_group.set_visible(true)
    
    get_character_placement(ally_group, allies)
    get_character_placement(enemy_group, enemies)
    
    combat_manager.get_combatants_list(ally_group, enemy_group)
    combat_manager.create_queue()
    combat_manager.next_turn()

##Searchs the hpbar and texture position 
func get_character_placement(group: Node2D, ally_or_enemies: Array):
    
    var character_placements = group.get_children()
    
    for i in range(min(character_placements.size(), ally_or_enemies.size())):
        var character_pos = character_placements[i]
        var combatant = ally_or_enemies[i]
        
        character_pos.set_combatant(combatant)
        character_pos.set_up()

        
        for vbox in character_pos.get_children():
            # Configurar la barra de vida
            var hpbar: ProgressBar = vbox.get_node_or_null("Healthbar")
            if hpbar:
                set_initial_character_hpbar(hpbar, combatant)

            # Configurar la textura con dimensiones ajustadas
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
