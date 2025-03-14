extends Node
class_name CombatActionManager


func command_action(player, target, action_selected, action_type):
    var player_actions = get_actions_available(player, action_type)
    for resource in player_actions:
        if resource.name == action_selected:
            use_action(resource, player, target)

func get_actions_available(player, type):
    var player_actions = player.get_actions(type)
    return player_actions
    
func use_action(resource, player, target):
    resource.apply(player, target)
    
    
