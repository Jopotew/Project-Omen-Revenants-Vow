
extends Node


var allies: Array = []
var enemies: Array = []
var player_data
## Guarda los combatientes antes de cambiar de escena
func set_combatants(_allies: Array, _enemies: Array):
    allies = _allies
    enemies = _enemies


func set_player_data(player: PackedScene):
    player_data = player.instantiate()
    
func get_player_data():
    return player_data
