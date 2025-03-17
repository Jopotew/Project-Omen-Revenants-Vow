
class_name Enums

enum DamageType{Magic = 0, Physical= 1, True= 2}

enum DefenseType{Magic = 0, Physical = 1}



enum SkillType {
    ATTACK = 0,    ## Se usa para hacer daño a enemigos.
    SUPPORT = 1,   ## Se usa para ayudar a aliados (curación, buff, etc.).
    CONTROL = 2,   ## Se usa para debilitar o incapacitar a un enemigo (CC).
    AUTO_USE = 3   ## Se usa exclusivamente en el propio usuario.
}

enum TargetType{
    SELF, 
    SINGLE, 
    DOUBLE, 
    TRIPLE,
    CUADRUPLE,
    ALL   
}


## Cada efecto individual es de un solo tipo
enum EffectType {
    NONE = 0,
    ATTACK = 1,        ## Inflige daño directo.
    BUFF = 2,          ## Mejora atributos.
    DEBUFF = 3,        ## Reduce atributos o aplica estados negativos.
    HEAL = 4,          ## Restaura HP o recursos.
    CC = 5,            ## Controla el objetivo (stun, silence, etc.).
    CORRUPTION = 6,    ## Aumenta corrupción.
    CONSUMPTION = 7,   ## Sacrifica HP o recursos a cambio de algo.
    VAMP = 8           ## Roba vida proporcional al daño infligido.
}


## Una habilidad puede tener múltiples efectos combinados
enum AffectType {
    NONE = 0,
    ATTACK = 1 << 0,      ## Inflige daño.
    BUFF = 1 << 1,        ## Mejora atributos.
    DEBUFF = 1 << 2,      ## Reduce atributos o aplica efectos negativos.
    HEAL = 1 << 3,        ## Restaura HP o recursos.
    CC = 1 << 4,          ## Controla el movimiento o acciones del objetivo.
    CORRUPTION = 1 << 5,  ## Aumenta corrupción en el objetivo o usuario.
    CONSUMPTION = 1 << 6, ## Absorbe HP o recursos a cambio de un beneficio.
    VAMP = 1 << 7         ## Roba vida proporcional al daño infligido.
}

enum ElementalType {
    Fire = 0,
    Water = 1,
    Earth = 2,
    Air = 3,
    Electric = 4,
    Ice = 5,
    Shadow = 6,
    Light = 7,
    Poison = 8,
    Arcane = 9,
    Dimensional = 10,
    Neutral = 11,
    Corrupted = 12,
}

enum NPCStates {
    IDLE,        
    ARROGANCE,  
    DECISION,   
    BERSERK,    
    ACTION,     
    END_TURN,   
    DEATH
}

enum CharacterRole{
    ALLY, 
    ENEMY,
    PLAYER,
    NEUTRAL
}


enum PosibleTargets{
    SELF,
    ALLY, 
    ENEMY,
    AOE 
}


enum CombatState{
    NONE,
    BERSERK,
    ARROGANCE      
}

enum HealthThreshold {
    HIGH,
    MEDIUM,
    LOW,
    VERY_LOW,
}
