class_name CombatMenu
extends Control


@onready var combat_menu: CombatMenu = $"."
@onready var options_menu: VBoxContainer = $MarginContainer/OptionsMenu
@onready var attacks_menu: VBoxContainer = $MarginContainer/AttacksMenu
@onready var skills_menu: VBoxContainer = $MarginContainer/SkillsMenu
@onready var items_menu: VBoxContainer = $MarginContainer/ItemsMenu

var actual_menu = null

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Options Menu
func _on_attack_pressed() -> void:
    actual_menu = attacks_menu
    open_menu(attacks_menu)

func _on_items_pressed() -> void:
    actual_menu = items_menu
    open_menu(items_menu)
    
func _on_flee_pressed() -> void:
    print("Flee")
    CombatSignals.action_selected.emit("flee")  # Enviar señal de huida
    
func _on_skills_pressed() -> void:
    actual_menu = skills_menu
    open_menu(skills_menu)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Attacks Menu
func _on_normal_attack_pressed() -> void:
    print("Normal Attack")
    CombatSignals.action_selected.emit("normal_attack")  # Emitir señal para el ataque normal
    set_invisible_menu()
    
func _on_heavy_attack_pressed() -> void:
    print("Heavy Attack")
    CombatSignals.action_selected.emit("heavy_attack")  # Emitir señal para el ataque fuerte
    set_invisible_menu()
    
func _on_physical_attack_skill_pressed() -> void:
    print("Physical Skill Attack")
    CombatSignals.action_selected.emit("physical_skill_attack")  # Emitir señal para habilidad física
    set_invisible_menu()
    

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Skills Menu
func _on_skill_1_pressed() -> void:
    CombatSignals.action_selected.emit("skill_1")
    set_invisible_menu()
    
func _on_skill_2_pressed() -> void:
    CombatSignals.action_selected.emit("skill_2")
    set_invisible_menu()
    
func _on_skill_3_pressed() -> void:
    CombatSignals.action_selected.emit("skill_3")
    set_invisible_menu()
    
func _on_skill_4_pressed() -> void:
    CombatSignals.action_selected.emit("skill_4")
    set_invisible_menu()
    
func _on_skill_5_pressed() -> void:
    CombatSignals.action_selected.emit("skill_5")
    set_invisible_menu()
    

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Items Menu
func _on_item_1_pressed() -> void:
    CombatSignals.action_selected.emit("item_1")
    set_invisible_menu()
    
func _on_item_2_pressed() -> void:
    CombatSignals.action_selected.emit("item_2")
    set_invisible_menu()
    
func _on_item_3_pressed() -> void:
    CombatSignals.action_selected.emit("item_3")
    set_invisible_menu()
    
func _on_item_4_pressed() -> void:
    CombatSignals.action_selected.emit("item_4")
    set_invisible_menu()
    
func _on_item_5_pressed() -> void:
    CombatSignals.action_selected.emit("item_5")
    set_invisible_menu()
    

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
