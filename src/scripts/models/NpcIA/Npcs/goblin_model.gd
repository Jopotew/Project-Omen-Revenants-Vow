extends BaseNpcFSM
class_name GoblinFSM


func state_idle(npc, target):
    if is_my_turn(npc):
        var npc_threshold = get_health_threshold(npc)
        var target_threshold = get_health_threshold(target)
        
        # Si el NPC está en HIGH y el objetivo en VERY_LOW => ARROGANCE
        if npc_threshold == Enums.HealthThreshold.HIGH and target_threshold == Enums.HealthThreshold.VERY_LOW:
            current_state = Enums.NPCStates.ARROGANCE
        
        # Si el NPC está por debajo de 25% => BERSERK
        elif npc_threshold == Enums.HealthThreshold.VERY_LOW:
            current_state = Enums.NPCStates.BERSERK
        
        # Caso contrario => DECISION
        else:
            current_state = Enums.NPCStates.DECISION
