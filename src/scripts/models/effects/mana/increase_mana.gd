extends Effect
class_name IncreaseManaEffect

var mana: int 

func apply(target):
    target.increase_combat_mana(mana)
