extends Node

var combat_data: Dictionary = {}

const COMBAT_SCENE_PATH = "res://scenes/combat_scenes/combat_scene1.tscn"

func set_combat_data(player: PackedScene, allies: Array = [], enemies: Array = []):
    var instantiated_allies = []
    for ally in allies:
        instantiated_allies.append(ally.instantiate())

    var instantiated_enemies = []
    for enemy in enemies:
        instantiated_enemies.append(enemy.instantiate())

    combat_data = {
        "player": player.instantiate(),
        "allies": instantiated_allies,
        "enemies": instantiated_enemies
    }

## Obtiene los datos del combate
func get_combat_data() -> Dictionary:
    return combat_data
    
    

## Inicia la escena de combate con los datos guardados
func start_combat():
    get_tree().change_scene_to_file(COMBAT_SCENE_PATH)
