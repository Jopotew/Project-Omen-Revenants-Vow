extends BaseNpcFSM
class_name GoblinFSM



## IDLE: verifica si es su turno y decide si pasa a ARROGANCE, BERSERK o DECISION.
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
            
            
            
## ARROGANCE: cree que ganará fácilmente; toma una acción agresiva.
func state_arrogance(npc, target):
    var roll = get_prob()
    var skills = get_npc_skills(npc)
    var attacks = get_npc_attacks(npc)
    # Ej: 70% big attack, 30% 'taunt'
    if roll < 0.70:
        npc.chosen_action = "big_attack"
    else:
        npc.chosen_action = "taunt"

    current_state = Enums.NPCStates.ACTION          
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
