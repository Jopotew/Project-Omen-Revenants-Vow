class_name CombatMenu
extends Control

@onready var combat_menu: CombatMenu = $"." 
@onready var options_menu: VBoxContainer = $MarginContainer/OptionsMenu
@onready var attacks_menu: VBoxContainer = $MarginContainer/AttacksMenu
@onready var skills_menu: VBoxContainer = $MarginContainer/SkillsMenu
@onready var items_menu: VBoxContainer = $MarginContainer/ItemsMenu

var actual_menu = null

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# MÉTODO PARA ACTUALIZAR BOTONES DESDE CharacterPlacement
func update_menus(skills: Array, attacks: Array, items: Array) -> void:
    """
    Actualiza los botones con los nombres de las habilidades, ataques e ítems.

    :param skills: Lista de nombres de habilidades.
    :param attacks: Lista de nombres de ataques.
    :param items: Lista de nombres de ítems.
    """
    _set_button_texts(skills_menu, skills, "skills")
    _set_button_texts(attacks_menu, attacks, "attacks")
    _set_button_texts(items_menu, items, "items")

func _set_button_texts(menu: Control, names: Array, action_type: String) -> void:
    """
    Asigna los nombres a los botones de un menú y conecta sus señales con su tipo de acción.

    :param menu: Nodo de menú que contiene los botones.
    :param names: Lista de nombres a asignar a los botones.
    :param action_type: Tipo de acción ("skills", "attacks", "items").
    """
    var index = 0
    for button in menu.get_children():
        if button is Button and button.name != "Back" and button.name != "Ascended":
            if index < names.size():
                button.text = names[index]
                button.visible = true  
                
                # Guardamos el tipo de acción en el botón para recuperarlo al ser presionado
                button.set_meta("action_type", action_type)

                # Desconectar señales previas para evitar acumulación
                if button.is_connected("pressed", Callable(self, "_on_button_pressed")):
                    button.disconnect("pressed", Callable(self, "_on_button_pressed"))

                # Conectar la señal con el nombre de la acción real
                button.connect("pressed", Callable(self, "_on_button_pressed").bind(names[index], action_type))
                
                index += 1
            else:
                button.visible = false  # Ocultar botones sin acción asignada

func _on_button_pressed(action_name: String, action_type: String) -> void:
    """
    Emite la señal con el nombre de la habilidad, ataque o ítem seleccionado y su tipo.

    :param action_name: Nombre de la acción seleccionada.
    :param action_type: Tipo de la acción (skills, attacks, items).
    """
    print("Acción seleccionada:", action_name, " | Tipo:", action_type)
    CombatSignals.action_selected.emit(action_name, action_type)
    set_invisible_menu()
    
    
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Manejo de Menús

func _on_attack_pressed() -> void:
    actual_menu = attacks_menu
    open_menu(attacks_menu)

func _on_items_pressed() -> void:
    actual_menu = items_menu
    open_menu(items_menu)
    
func _on_flee_pressed() -> void:
    CombatSignals.action_selected.emit("flee")  # Enviar señal de huida
    
func _on_skills_pressed() -> void:
    actual_menu = skills_menu
    open_menu(skills_menu)

func _on_back_pressed() -> void:
    go_back(actual_menu)    

func open_menu(new_menu):
    new_menu.set_visible(true)
    options_menu.set_visible(false)
    
func go_back(actual_menu):
    options_menu.set_visible(true)
    actual_menu.set_visible(false)
    
func set_invisible_menu():
    combat_menu.set_visible(false)
