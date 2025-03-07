class_name CombatQueue
extends Node

var queue : Array

func add_to_queue(combatant):
    queue.append(combatant)

func create_queue():
    queue.sort_custom(sort_by_speed)
    
func get_queue():
    return queue  
    
func sort_by_speed(a, b):
    if a.stats.speed  > b.stats.speed:
        return true
    return false

func get_turn() -> Node2D:
    var turn = queue.front()
    return turn
    
func modify_queue(char_turn : Node2D):
    queue.pop_front()
    queue.push_back(char_turn)
