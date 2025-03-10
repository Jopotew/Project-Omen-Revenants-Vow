extends Effect
class_name CcEffect

## Duración del efecto en turnos
@export var duration: int = 1  



func _init() -> void:
    name = "Crowd Cotrol Effect"
    

func apply(target):
    target.pass_turn(duration)
