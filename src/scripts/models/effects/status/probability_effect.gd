extends Effect
class_name ProbabilityEffect


@export var probability: float 
@export var effect: Effect

func _init() -> void:
    name = "Probability Effect"
    
func apply(target):
    var prob = randf()
    if prob <= probability:
        effect.apply(target)
        
    
    
