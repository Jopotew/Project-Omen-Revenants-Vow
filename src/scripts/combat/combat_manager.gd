class_name CombatManager
extends Node

@onready var combat_queue: CombatQueue = $"../CombatQueue"
@onready var action_manager: CombatActionManager = $"../CombatActions"

#====================================================
# VARIABLES PRINCIPALES
#====================================================

var turn_queue: Array  # Cola de turnos
var combat_list: Array  # Lista de combatientes en combate
var placeholder_list: Array  # Lista de nodos de UI para selección de objetivos

var player: Node2D  # Referencia al jugador
var action_selected: String  # Nombre de la acción seleccionada
var action_type: String  # Tipo de acción seleccionada (skills, items, attacks)

var target_index: int = 0  # Índice del objetivo actual en la lista
var selecting_target: bool = false  # Indica si se está eligiendo un objetivo
var selected_control_node_target: Control = null  # Nodo UI del objetivo seleccionado
var combatant_targeted: Node2D = null  # Nodo del combatiente objetivo

#====================================================
# INICIALIZACIÓN DEL COMBATE
#====================================================

func _ready() -> void:
    """
    Conecta la señal de selección de acción al manejador correspondiente.
    """
    CombatSignals.action_selected.connect(_on_action_selected)

func combatant_set_up(p, allies, enemies, ally_group, enemy_group):
    """
    Configura la lista de combatientes y prepara la pelea.

    :param p: Referencia al jugador.
    :param allies: Lista de aliados en combate.
    :param enemies: Lista de enemigos en combate.
    :param ally_group: Nodo contenedor de aliados.
    :param enemy_group: Nodo contenedor de enemigos.
    """
    combat_list.clear()
    combat_list.append(p)
    player = p
    combat_list.append_array(allies)
    combat_list.append_array(enemies)
    combat_preparation()

    placeholder_list.append_array(ally_group.get_children())
    placeholder_list.append_array(enemy_group.get_children())

func combat_preparation():
    """
    Inicializa el estado de todos los combatientes, indicándoles que están en combate.
    """
    for combatant in combat_list:
        combatant.in_combat(true)

func create_queue():
    """
    Crea la cola de turnos con todos los combatientes en combate.
    """
    for combatant in combat_list:
        combat_queue.add_to_queue(combatant)
    combat_queue.create_queue()

#====================================================
# MANEJO DE TURNOS
#====================================================

func next_turn():
    """
    Avanza al siguiente turno en la cola de combate.
    """
    var turn = combat_queue.get_turn()
    set_action_turn(turn)

func set_action_turn(char_turn: Node2D):
    """
    Marca el turno del personaje actual y gestiona su acción.

    :param char_turn: Nodo del combatiente cuyo turno está activo.
    """
    char_turn.battle_conditions.set_action_turn(true)  # Activa el turno del personaje

    if char_turn.name == "Player":
        print(player.stats.health)
        handle_player_turn()
    else:
        handle_enemy_turn(char_turn)

func handle_player_turn():
    """
    Maneja el turno del jugador, activando la selección de objetivo.
    """
    print("Turno del jugador")
    start_target_selection()

func handle_enemy_turn(npc: Node2D):
    """
    Maneja el turno del enemigo, ejecutando su IA después de un tiempo de espera.

    :param enemy: Nodo del enemigo que tiene el turno.
    """
    
    print("Turno del enemigo:", npc.name)
    
    npc.battle_conditions.action_turn = true
    
    await get_tree().create_timer(1.5).timeout  
    
    npc.fsm.state_idle(npc, get_target())
    
    end_turn()


#====================================================
# SELECCIÓN DE OBJETIVO
#====================================================

func start_target_selection():
    """
    Inicia la selección de objetivo.
    """
    if combat_list.is_empty():
        return

    selecting_target = true
    target_index = 0  # Reiniciar el índice al inicio
    update_target_selection()

func _unhandled_input(event: InputEvent):
    """
    Maneja la entrada del usuario para cambiar o confirmar el objetivo.

    :param event: Evento de entrada detectado.
    """
    if not selecting_target:
        return

    if event is InputEventKey and event.pressed:
        if event.is_action_pressed("ui_right"):
            move_target_selection(1)
        elif event.is_action_pressed("ui_left"):
            move_target_selection(-1)
        elif event.is_action_pressed("ui_accept"):
            confirm_target_selection()

func move_target_selection(direction: int):
    """
    Cambia la selección de objetivo en la lista.

    :param direction: Dirección de cambio de selección (1 para avanzar, -1 para retroceder).
    """
    target_index = (target_index + direction + combat_list.size()) % combat_list.size()
    update_target_selection()

func update_target_selection():
    """
    Actualiza la selección de objetivo en la interfaz.
    """
    if combat_list.is_empty():
        return

    if selected_control_node_target:
        set_target_highlight(selected_control_node_target, false)

    selected_control_node_target = placeholder_list[target_index]
    set_target_highlight(selected_control_node_target, true)
    combatant_targeted = selected_control_node_target.assigned_combatant

func confirm_target_selection():
    """
    Confirma el objetivo seleccionado y activa el menú de combate.
    """
    selecting_target = false
    activate_combat_menu()

func set_target_highlight(control_node: Control, visible: bool):
    """
    Muestra o esconde el resaltado del objetivo seleccionado.

    :param control_node: Nodo de control del objetivo.
    :param visible: Determina si el resaltado debe estar visible o no.
    """
    for vbox in control_node.get_children():
        var target: TextureRect = vbox.get_node_or_null("TargetHighlight")
        if target and combatant_targeted:
            target.set_visible(visible)

            var dimensions = combatant_targeted.stats.get_dimensions()
            target.custom_minimum_size = dimensions
            target.size = dimensions
            target.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED


func get_target():
    var targets_allowed: Array
    for combatant in combat_list:
        if combatant.stats.character_role != Enums.CharacterRole.ENEMY:
            targets_allowed.append(combatant)
            
    return targets_allowed.pick_random()
                
    
#====================================================
# EJECUCIÓN DE ACCIONES
#====================================================

func _on_action_selected(action_name: String, type: String):
    """
    Ejecuta la acción seleccionada sobre el objetivo elegido.

    :param action_name: Nombre de la acción seleccionada.
    :param type: Tipo de la acción (skills, items, attacks).
    """
    action_selected = action_name
    action_type = type
    action_manager.command_action(player, combatant_targeted, action_selected, action_type)
    
    update_health_bar(combatant_targeted)
    end_turn()

func update_health_bar(combatant: Node2D): #no anda
    """
    Actualiza la barra de vida del combatiente tras recibir una acción.

    :param combatant: Nodo del combatiente cuya vida se actualiza.
    """
    for vbox in selected_control_node_target.get_children():
        var hpbar: ProgressBar = vbox.get_node_or_null("Healthbar")
        if hpbar:
            hpbar.value = combatant.combat_stats.health

func end_turn():
    """
    Finaliza el turno actual y pasa al siguiente combatiente.
    """
    combat_queue.modify_queue(combat_queue.get_turn())  # Mueve al combatiente actual al final de la cola
    next_turn()

#====================================================
# MENÚ DE COMBATE
#====================================================

func activate_combat_menu():
    """
    Activa el menú de combate del objetivo seleccionado.
    """
    for menu in selected_control_node_target.get_children():
        if menu.name == "CombatMenu":
            menu.set_visible(true)
            
            
