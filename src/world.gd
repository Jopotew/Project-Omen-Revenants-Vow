extends Node2D

const PLAYER_SCENE = preload("res://scenes/characters/player.tscn")
const BASIC_ENEMY_MODEL_1 = preload("res://scenes/characters/basic_enemy_model_1.tscn")

## Configuración de combate (deben haber 1-3 enemigos, aliados opcionales)
var allies = [BASIC_ENEMY_MODEL_1] 
var enemies = [BASIC_ENEMY_MODEL_1, BASIC_ENEMY_MODEL_1]








func _ready():
    randomize()
    
    

func _process(delta: float) -> void:
    if Input.is_action_just_pressed("ui_accept"):
        CombatTransitioner.set_combat_data(PLAYER_SCENE, allies, enemies)
        CombatTransitioner.start_combat()
        print("Cambio de escena con combatientes guardados")
