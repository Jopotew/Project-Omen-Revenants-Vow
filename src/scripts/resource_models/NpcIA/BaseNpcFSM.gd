extends Resource
class_name BaseNpcFSM



var current_state: int = Enums.NPCStates.IDLE



func state_update(npc, target):
    match current_state:
        Enums.NPCStates.IDLE:
            state_idle(npc, target)
        Enums.NPCStates.ARROGANCE:
            state_arrogance(npc, target)
        Enums.NPCStates.DECISION:
            state_decision(npc, target)
        Enums.NPCStates.BERSERK:
            state_berserk(npc, target)
        Enums.NPCStates.ACTION:
            state_action(npc, target)
        Enums.NPCStates.END_TURN:
            state_end_turn(npc, target)
        Enums.NPCStates.DEATH:
            state_death(npc, target)
            
            

## Estado de espera: se activa hasta que sea su turno (o se cumpla alguna otra condición).
func state_idle(npc, target):
    # Ej: Verifica si es mi turno, si es el caso => current_state = ...
    pass

## Estado especial si el NPC es muy confiado.
func state_arrogance(npc, target):
    # Ej: Decide acción agresiva => current_state = ACTION
    pass

## Estado "normal" donde el NPC elige acción (ataque, buff, debuff, etc.).
func state_decision(npc, target):
    # Ej: Lógica por defecto => current_state = ACTION
    pass

## Estado de furia o último recurso (poca vida).
func state_berserk(npc, target):
    # Ej: Lógica desesperada => current_state = ACTION
    pass

## Ejecución de la acción elegida: aplica efectos, anima, etc.
func state_action(npc, target):
    # Ej: Llama a la habilidad => current_state = END_TURN
    pass

## Fin de turno: notifica al CombatManager y regresa a IDLE
func state_end_turn(npc, target):
    # Ej: npc.end_my_turn()
    # current_state = IDLE
    pass

## Estado de muerte: no actúa más.
func state_death(npc, target):
    pass


##Devuelve el estado de combate del npc. Siendo True si es su turno, False si no.
func is_my_turn(npc_combat_stats) -> bool:
    return npc_combat_stats.action_turn

func get_health_threshold(entity) -> int:
    var ratio = float(entity.health) / entity.max_health
    if ratio > 0.75:
        return Enums.HealthThreshold.HIGH
    elif ratio > 0.50:
        return Enums.HealthThreshold.MEDIUM
    elif ratio > 0.25:
        return Enums.HealthThreshold.LOW
    else:
        return Enums.HealthThreshold.VERY_LOW


func get_npc_skills(npc) -> Array:
    var skills: Array[Ability]= npc.battle_conditions.get_combat_skills()
    return skills
    
func get_npc_attacks(npc) -> Array:
    var attacks: Array[Ability] = npc.battle_conditions.get_combat_attacks()
    return attacks

func get_prob():
    return randf_range(0, 1)
