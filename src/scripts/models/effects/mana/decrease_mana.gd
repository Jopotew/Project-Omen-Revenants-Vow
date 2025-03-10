extends Effect
class_name DecreaseManaEffect

var mana: int 




func _init() -> void:
    name = "Decrease Mana"
    

func apply(target):
    target.decrease_combat_mana(mana)
