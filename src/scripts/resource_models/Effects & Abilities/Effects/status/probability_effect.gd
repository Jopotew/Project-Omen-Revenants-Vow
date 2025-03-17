extends Effect
class_name ProbabilityEffect


@export_range(0.0, 1.0) var probability: float = 0.5

@export var effect: Effect

func _init() -> void:
    name = "Probability Effect"
    
func apply(target):
    var prob = randf()
    if prob <= probability:
        effect.apply(target)
        
    
    
