extends Node2D

## Referencia a la escena de combate
const COMBAT_SCENE_PATH = "res://scenes/combat_scenes/combat_scene1.tscn"
const player = preload("res://scenes/characters/player.tscn")
const BASIC_ENEMY_MODEL_1 = preload("res://scenes/characters/basic_enemy_model_1.tscn")
## Ejemplo de combatientes (esto debería venir de tu sistema real)
var allies = [player, BASIC_ENEMY_MODEL_1]
var enemies = [
   BASIC_ENEMY_MODEL_1, BASIC_ENEMY_MODEL_1
]

func _process(delta: float) -> void:
    if Input.is_action_just_pressed("ui_accept"):
        start_combat()

## Guarda los combatientes en el Autoload y cambia de escena
func start_combat():
    CombatData.set_combatants(allies, enemies)
    CombatData.set_player_data(player)
    get_tree().change_scene_to_file(COMBAT_SCENE_PATH)
    print("cambio de escena")
