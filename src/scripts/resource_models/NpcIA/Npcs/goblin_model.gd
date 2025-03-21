extends BaseNpcFSM
class_name GoblinFSM



## IDLE: verifica si es su turno y decide si pasa a ARROGANCE, BERSERK o DECISION.
func state_idle(npc, target):
    if is_my_turn(npc):
        var npc_threshold = get_health_threshold(npc)
        
        """
        Cosas que deberia hacer todo esto:
            
        1) Recibir la lista de todos los pjs en combate
        2) Ver informacion de los pjs y propia
            
                Analiza la situación del combate y decide la acción del NPC en base a múltiples factores.

                1. **Priorizar enemigos según peligro**
                    - Si hay un enemigo con alto ataque o velocidad, considerarlo una amenaza prioritaria.
                    - Si hay un enemigo con habilidades de curación o buffs, atacarlo primero para evitar que fortalezca a su equipo.

                2. **Considerar el estado de los aliados**
                    - Si hay un aliado con buffs activos, tal vez valga la pena potenciarlo más.
                    - Si un aliado está aturdido o inmovilizado (CC), considerar liberarlo antes de atacar.
                    - Si un aliado tiene poca vida y hay una habilidad de sacrificio, podría usarla para salvarlo.

                3. **Evaluar si es momento de potenciarse**
                    - Si el combate acaba de empezar, considerar usar buffs en vez de atacar directamente.
                    - Si el NPC está en desventaja, usar buffs defensivos en vez de atacar.
                    - Si ha perdido aliados y queda en minoría, enfocarse en sobrevivir más tiempo con buffs y curaciones.

                4. **Adaptarse al estado del combate**
                    - Si quedan pocos combatientes en ambos equipos, puede volverse más agresivo o defensivo.
                    - Si el enemigo usa mucha magia, aumentar su defensa mágica antes de que lo ataquen.
                    - Si el combate se alarga demasiado, considerar ataques que agoten recursos del enemigo (reducción de maná, venenos, etc.).

                5. **Aprovechar ventajas elementales**
                    - Si el enemigo tiene una gran debilidad elemental, priorizar ataques con ese elemento.
                    - Si el NPC tiene resistencia a cierto tipo de ataque, provocar al enemigo para que lo ataque sin hacerle mucho daño.

                6. **Usar estrategias de control (CC)**
                    - Si el equipo enemigo tiene una gran ventaja numérica, intentar aturdir o ralentizar a varios enemigos para igualar el campo.
                    - Si un enemigo es demasiado fuerte, enfocarse en inmovilizarlo en vez de intentar matarlo directamente.

                7. **Evaluar recursos restantes**
                    - Si el NPC tiene poca energía o maná, priorizar ataques físicos o pasivos.
                    - Si quedan pocos turnos de buffs activos, decidir si refrescarlos o no.

                Después de evaluar estas condiciones, el NPC decidirá si:
                - Atacar agresivamente.
                - Usar un buff o debuff.
                - Apoyar a un aliado.
                - Curarse o protegerse.
                - Controlar al enemigo con efectos de CC.

        
        """
        
        
        
        
        
        
        
        
        var target_threshold = get_health_threshold(target)
        var prob = get_prob()
        # Si el NPC está en HIGH y el objetivo en VERY_LOW => ARROGANCE
        if npc_threshold == Enums.HealthThreshold.HIGH and target_threshold == Enums.HealthThreshold.VERY_LOW or target_threshold == Enums.HealthThreshold.LOW :
            if prob < 0.15:
                print("ARROGANCE")
                current_state = Enums.NPCStates.ARROGANCE
                state_arrogance(npc, target)
            else:
                print("DECISION")
                current_state = Enums.NPCStates.DECISION
                state_decision(npc, target)
        
        # Si el NPC está por debajo de 25% => BERSERK
        elif npc_threshold == Enums.HealthThreshold.VERY_LOW:
            if prob < 0.15:
                print("BERSERK")
                current_state = Enums.NPCStates.BERSERK
                state_berserk(npc, target)
            else:
                print("DECISION")
                current_state = Enums.NPCStates.DECISION
                state_decision(npc, target)
        
        # Caso contrario => DECISION
        else:
            print("DECISION")
            current_state = Enums.NPCStates.DECISION
            state_decision(npc, target)
            
            
            
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
    
    
    var chosen_action = null

    if roll < 0.66 and buffs.size() > 0:
        chosen_action = buffs.pick_random() 
    elif attacks.size() > 0:
        chosen_action = attacks.pick_random()  
    print("CHOSEN ACTION : ", chosen_action)
    if chosen_action != null:
        npc.battle_conditions.set_combat_action(chosen_action)
        current_state = Enums.NPCStates.ACTION
        state_action(npc, target)
    else:
        print("No hay acciones disponibles en estado ARROGANCE, pasando a acción por defecto.")
        current_state = Enums.NPCStates.DECISION
        state_decision(npc, target)

            
func state_berserk(npc, target):
    var roll = get_prob()
    var skills = npc.battle_conditions.get_combat_skills()  

    var berserk_attacks: Array[Ability] = []
    var berserk_buffs: Array[Ability] = []

    
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
        
    print("CHOSEN ACTION : ", chosen_action.name)    
    if chosen_action == null:
        current_state = Enums.NPCStates.DECISION
        state_decision(npc, target)
        
    else:
        npc.battle_conditions.set_combat_action(chosen_action)
        current_state = Enums.NPCStates.ACTION
        state_action(npc, target)
    
func state_decision(npc, target):
    var roll = get_prob()
    var skills = npc.battle_conditions.get_combat_skills()  
    var attacks = npc.battle_conditions.get_combat_attacks()  

    var attack_skills: Array[Ability] = []
    var decision_buffs: Array[Ability] = []
    var decision_debuffs: Array[Ability] = []
    var decision_heals: Array[Ability] = []

    
    for skill in skills:
        
        if skill.state == Enums.CombatState.NONE:
            match skill.type:
                Enums.AffectType.Attack:
                    attack_skills.append(skill)  
                Enums.AffectType.Buff:
                    decision_buffs.append(skill)
                Enums.AffectType.Debuff:
                    decision_debuffs.append(skill)
                Enums.AffectType.Heal:
                    decision_heals.append(skill)

    var chosen_action = null
    
    if roll < 0.50 and attacks.size() > 0:
        chosen_action = attacks.pick_random()

    else:
        var skill_roll = get_prob()

        if skill_roll < 0.20 and decision_buffs.size() > 0:
            chosen_action = decision_buffs.pick_random()  
        elif skill_roll < 0.40 and decision_debuffs.size() > 0:
            chosen_action = decision_debuffs.pick_random()  
        elif skill_roll < 0.90 and attack_skills.size() > 0:
            chosen_action = attack_skills.pick_random()  
        elif decision_heals.size() > 0:
            chosen_action = decision_heals.pick_random() 

    print("CHOSEN ACTION : ", chosen_action.name)
    if chosen_action == null and attacks.size() > 0:
        chosen_action = attacks.pick_random()

    
    npc.battle_conditions.set_combat_action(chosen_action)
    current_state = Enums.NPCStates.ACTION
    state_action(npc, target)


            
func state_action(npc, target):
    var chosen_action = npc.battle_conditions.get_combat_action()

    if chosen_action == null:
        print("No hay acción seleccionada en ACTION. Pasando a END_TURN.")
        current_state = Enums.NPCStates.END_TURN
        return

    if chosen_action is Ability:
        print(npc.stats.name + " usa " + chosen_action.name + " contra " + target.stats.name)
        chosen_action.apply(npc, target)
    else:
        print("Acción desconocida en ACTION:", chosen_action)

    current_state = Enums.NPCStates.END_TURN
    state_end_turn(npc, target)
    
    
func state_end_turn(npc, target):
    print("")
    print("")
    npc.battle_conditions.set_action_turn(false)
    emit_signal("turn_ended")
    current_state = Enums.NPCStates.IDLE

    
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
