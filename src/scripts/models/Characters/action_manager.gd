extends Node
class_name CombatActionManager



var player
var target
var action

func set_vars(player, target):
    pass

func get_actions_available(player):
    print("ACTIONS AVAILABLE ", player)
    var player_actions = player.get_actions()
    print(player_actions)
    
