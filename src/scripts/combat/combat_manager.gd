class_name CombatManager
extends Node

@onready var combat_queue: CombatQueue = $"../CombatQueue"
@onready var action_manager: CombatActionManager = $"../CombatActions"


#~~~~~~~~~~~~~~~~~~
# VARIABLES PRINCIPALES

var turn_queue: Array  # Lista de turnos
var combat_list: Array  # Lista de todos los combatientes
var placeholder_list: Array

var player
var action_selected
var action_type

var target_index: int = 0  # Índice del objetivo actual
var selecting_target: bool = false  # Indica si se está eligiendo un objetivo
var selected_control_node_target: Control = null  # Nodo de control del objetivo seleccionado
var combatant_targeted: Node2D = null  # Nodo 2D del objetivo seleccionado

#~~~~~~~~~~~~~~~~~~
# FUNCIONES PARA INICIALIZAR COMBATE Y LISTAS

func _ready() -> void:
    CombatSignals.action_selected.connect(_on_action_selected)


func _on_action_selected(action_name, type):
    action_selected = action_name
    action_type = type
    action_manager.command_action(player, combatant_targeted, action_selected, action_type)
    

func combatant_set_up(p, allies, enemies, ally_group, enemy_group):
    combat_list.clear()
    combat_list.append(p)
    player = p
    combat_list.append_array(allies)
    combat_list.append_array(enemies)
    combat_preparation()
    
    placeholder_list.append_array(ally_group.get_children())
    placeholder_list.append_array(enemy_group.get_children())
    
    
func combat_preparation():
    for combatant in combat_list:
        combatant.in_combat(true)
## Crea la cola de combate
func create_queue():
    for combatant in combat_list:
        combat_queue.add_to_queue(combatant)
    combat_queue.create_queue()

#~~~~~~~~~~~~~~~~~~
# MANEJO DE TURNOS

## Cambia al siguiente turno
func next_turn():
    var turn = combat_queue.get_turn()
    set_action_turn(turn)

## Marca el turno del personaje actual
func set_action_turn(char_turn : Node2D):
    char_turn.set_action_turn(true)  # Activa el turno del personaje

    if char_turn.name == "Player":
        combat_turn(char_turn)
        print("Turno del jugador")
    else:
        print("Turno enemigo")

## Maneja el turno del jugador y activa la selección de objetivo
func combat_turn(char_turn: Node2D):
    start_target_selection()

#~~~~~~~~~~~~~~~~~~
# SELECCIÓN DE OBJETIVO

## Inicia la selección de objetivo
func start_target_selection():
    if combat_list.is_empty():
        return
    selecting_target = true
    target_index = 0  # Reiniciar el índice al inicio
    update_target()

## Maneja la entrada del usuario para cambiar o confirmar el objetivo
func _unhandled_input(event: InputEvent):
    if not selecting_target:
        return  # Si no estamos en modo selección, ignoramos la entrada

    if event is InputEventKey and event.pressed:  # Solo detectar la pulsación inicial
        if event.is_action_pressed("ui_right"):
            target_index = (target_index + 1) % combat_list.size()  # Avanzar en la lista
            update_target()

        elif event.is_action_pressed("ui_left"):
            target_index = (target_index - 1 + combat_list.size()) % combat_list.size()  # Retroceder
            update_target()

        elif event.is_action_pressed("ui_accept"):
            confirm_target()

## Actualiza la selección en la consola (luego se puede agregar un indicador visual)
func update_target():
    if combat_list.is_empty():
        return
    if selected_control_node_target == null:
        selected_control_node_target = placeholder_list[target_index]
        set_target_visible(selected_control_node_target, true)
        combatant_targeted = selected_control_node_target.assigned_combatant
    else:   
        set_target_visible(selected_control_node_target, false)
        selected_control_node_target = placeholder_list[target_index]
        set_target_visible(selected_control_node_target, true)
        combatant_targeted = selected_control_node_target.assigned_combatant
    
## Confirma el objetivo seleccionado y finaliza la selección
func confirm_target():
    selecting_target = false  # Salir del modo de selección
    set_menu_up()
    

func set_target_visible(control_node: Control, value: bool):
    for vbox in control_node.get_children():
        var target: TextureRect = vbox.get_node_or_null("TargetHighlight")
        if target and combatant_targeted!= null :
            target.set_visible(value)
            
            var dimensions = combatant_targeted.get_dimensions()
            target.custom_minimum_size = dimensions
            target.size = dimensions
            target.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
        




#~~~~~~~~~~~~~~~~~~


#~~~~~~~~~~~~~~~~~~
# MENÚ DE COMBATE

## Activa el menú de combate del objetivo seleccionado
func set_menu_up():
    for menu in selected_control_node_target.get_children():
        if menu.name == "CombatMenu":
            menu.set_visible(true)
            
            
            
            
            
            
            
            
            
            
            
            
            
