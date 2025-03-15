extends Effect
class_name IncreaseManaEffect

var mana: int 

func apply(target):
    target.combat_stats.increase_combat_mana(mana)
