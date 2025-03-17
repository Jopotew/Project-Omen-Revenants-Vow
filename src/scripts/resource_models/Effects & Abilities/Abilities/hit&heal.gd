extends Ability
class_name OmnivampAbility

@export_range(0, 1) var omnivamp = 0


func apply(user, targets: Array):
    var damage: int
    for effect in cost:
        effect.apply(user)
        
    for target in targets:
        for effect in effects:
            if effect.type == Enums.EffectType.ATTACK:
                damage = effect.apply(target)
                var heal_effect = IncreaseHealthEffect.new()
                heal_effect.health = damage * omnivamp
                heal_effect.apply(target)
                
                
            
