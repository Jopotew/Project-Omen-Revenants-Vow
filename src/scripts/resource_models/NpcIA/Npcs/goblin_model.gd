extends BaseNpcFSM
class_name GoblinFSM



## IDLE: verifica si es su turno y decide si pasa a ARROGANCE, BERSERK o DECISION.
func state_idle(npc, target):
    if is_my_turn(npc):
        var npc_threshold = get_health_threshold(npc)
        var target_threshold = get_health_threshold(target)
        var prob = get_prob()
        # Si el NPC está en HIGH y el objetivo en VERY_LOW => ARROGANCE
        if npc_threshold == Enums.HealthThreshold.HIGH and target_threshold == Enums.HealthThreshold.VERY_LOW or target_threshold == Enums.HealthThreshold.LOW :
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
    var skills = npc.battle_conditions.get_combat_skills() 
    
    var attacks: Array[Ability] = []  
    var buffs: Array[Ability] = []  
    
    # Clasificar habilidades según tipo
    for skill in skills:
        if skill.state == Enums.CombatState.ARROGANCE:
            match skill.type:
                Enums.AffectType.Attack:
                    attacks.append(skill)
                Enums.AffectType.Buff:
                    buffs.append(skill)
    
    # Determinar qué acción tomar
    var chosen_action = null

    if roll < 0.66 and buffs.size() > 0:
        chosen_action = buffs.pick_random()  # Elige un buff aleatorio si hay disponibles
    elif attacks.size() > 0:
        chosen_action = attacks.pick_random()  # Elige un ataque aleatorio si hay disponibles
    
    if chosen_action != null:
        npc.battle_conditions.set_combat_action(chosen_action)
        current_state = Enums.NPCStates.ACTION
    else:
        print("No hay acciones disponibles en estado ARROGANCE, pasando a acción por defecto.")
        current_state = Enums.NPCStates.DECISION

            
func state_berserk(npc, target):
    var roll = get_prob()
    var skills = npc.battle_conditions.get_combat_skills()  

    var berserk_attacks: Array[Ability] = []
    var berserk_buffs: Array[Ability] = []

    # Clasificar habilidades según su tipo
    for skill in skills:
        if skill.state == Enums.CombatState.BERSERK:
            match skill.type:
                Enums.AffectType.Attack:
                    berserk_attacks.append(skill)
                Enums.AffectType.Buff:
                    berserk_buffs.append(skill)

   
    var chosen_action = null

    if roll < 0.66 and berserk_attacks.size() > 0:
        chosen_action = berserk_attacks.pick_random()  
    elif berserk_buffs.size() > 0:
        chosen_action = berserk_buffs.pick_random()  
        
        
    if chosen_action == null:
        current_state = Enums.NPCStates.DECISION
        
    else:
        npc.battle_conditions.set_combat_actions(chosen_action)
        current_state = Enums.NPCStates.ACTION
    
          
            
      

            
    
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
