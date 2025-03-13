extends BaseNpcFSM
class_name GoblinFSM


func state_idle(npc, target):
    if is_my_turn(npc):
        var npc_threshold = get_health_threshold(npc)
        var target_threshold = get_health_threshold(target)
        var prob = get_prob()
        # Si el NPC está en HIGH y el objetivo en VERY_LOW => ARROGANCE
        if npc_threshold == Enums.HealthThreshold.HIGH and target_threshold == Enums.HealthThreshold.VERY_LOW:
            if prob < 0.15:
                current_state = Enums.NPCStates.ARROGANCE
            else:
                current_state = Enums.NPCStates.DECISION
        
        # Si el NPC está por debajo de 25% => BERSERK
        elif npc_threshold == Enums.HealthThreshold.VERY_LOW:
            if prob < 0.15:
                current_state = Enums.NPCStates.BERSERK
            else:
                current_state = Enums.NPCStates.DECISION
        
        # Caso contrario => DECISION
        else:
            current_state = Enums.NPCStates.DECISION
