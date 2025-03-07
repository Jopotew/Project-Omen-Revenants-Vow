class_name CombatManager
extends Node

@onready var combat_queue: CombatQueue = $"../CombatQueue"

#~~~~~~~~~~~~~~~~~~
# VARIABLES PRINCIPALES

var turn_queue: Array  # Lista de turnos
var combatant_list: Array  # Lista de todos los combatientes

var target_index: int = 0  # Índice del objetivo actual
var selecting_target: bool = false  # Indica si se está eligiendo un objetivo
var selected_control_node_target: Control = null  # Nodo de control del objetivo seleccionado
var selected_node2d_target: Node2D = null  # Nodo 2D del objetivo seleccionado

#~~~~~~~~~~~~~~~~~~
# FUNCIONES PARA INICIALIZAR COMBATE Y LISTAS

func _ready() -> void:
    CombatSignals.action_selected.connect(_on_action_selected)


func _on_action_selected(action_name):
    print("Acción recibida:", action_name)

## Obtiene la lista de combatientes (aliados y enemigos)
func get_combatants_list(ally_group: Node2D, enemy_group: Node2D): 
    combatant_list.clear()  # Asegurar que la lista está vacía antes de agregar combatientes
    combatant_list.append_array(ally_group.get_children())
    combatant_list.append_array(enemy_group.get_children())

## Crea la cola de combate
func create_queue():
    combat_queue.create_queue()

#~~~~~~~~~~~~~~~~~~
# MANEJO DE TURNOS

## Cambia al siguiente turno
func next_turn():
    var turn = combat_queue.get_turn()
    print("Turno de:", turn.name)
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
    if combatant_list.is_empty():
        print("No hay combatientes disponibles.")
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
            target_index = (target_index + 1) % combatant_list.size()  # Avanzar en la lista
            update_target()

        elif event.is_action_pressed("ui_left"):
            target_index = (target_index - 1 + combatant_list.size()) % combatant_list.size()  # Retroceder
            update_target()

        elif event.is_action_pressed("ui_accept"):
            confirm_target()

## Actualiza la selección en la consola (luego se puede agregar un indicador visual)
func update_target():
    if combatant_list.is_empty():
        return
    selected_control_node_target = combatant_list[target_index]
    selected_node2d_target = selected_control_node_target.assigned_combatant
    
    print("Seleccionado:", selected_node2d_target.get_name())  # Para depuración

## Confirma el objetivo seleccionado y finaliza la selección
func confirm_target():
    selecting_target = false  # Salir del modo de selección
    print("Objetivo confirmado:", selected_node2d_target.get_name())
    set_menu_up()
    on_target_selected()

## Se ejecuta cuando un objetivo ha sido seleccionado
func on_target_selected():
    apply_action(selected_node2d_target)

#~~~~~~~~~~~~~~~~~~
# APLICACIÓN DE ACCIONES

## Aplica una acción al objetivo seleccionado (por ahora solo imprime)
func apply_action(target: Node2D):
    pass



#~~~~~~~~~~~~~~~~~~
# MENÚ DE COMBATE

## Activa el menú de combate del objetivo seleccionado
func set_menu_up():
    for menu in selected_control_node_target.get_children():
        if menu.name == "CombatMenu":
            menu.set_visible(true)
            
            
            
            
            
            
            
            
            
            
            
            
            
