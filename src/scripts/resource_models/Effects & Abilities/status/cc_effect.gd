extends Effect
class_name CcEffect


func _init() -> void:
    name = "Crowd Cotrol Effect"
    

func apply(target):
    target.battle_conditions.set_turns_inactive(duration)
