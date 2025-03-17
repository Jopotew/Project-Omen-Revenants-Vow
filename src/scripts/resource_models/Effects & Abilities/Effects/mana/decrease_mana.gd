extends Effect
class_name DecreaseManaEffect

@export var mana: int 




func _init() -> void:
    name = "Decrease Mana"
    

func apply(target):
    target.combat_stats.decrease_mana(mana)
