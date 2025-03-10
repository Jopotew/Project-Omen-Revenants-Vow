class_name ElementAffinity




func element_effectiveness(attack_element: Enums.ElementalType, target_element: Enums.ElementalType) -> float:
    var effective_against = {
        Enums.ElementalType.Fire: [Enums.ElementalType.Ice, Enums.ElementalType.Earth],
        Enums.ElementalType.Water: [Enums.ElementalType.Fire, Enums.ElementalType.Poison],
        Enums.ElementalType.Earth: [Enums.ElementalType.Poison, Enums.ElementalType.Water],
        Enums.ElementalType.Air: [Enums.ElementalType.Earth, Enums.ElementalType.Shadow],
        Enums.ElementalType.Electric: [Enums.ElementalType.Water, Enums.ElementalType.Air],
        Enums.ElementalType.Ice: [Enums.ElementalType.Earth, Enums.ElementalType.Water],
        Enums.ElementalType.Shadow: [Enums.ElementalType.Light, Enums.ElementalType.Arcane],
        Enums.ElementalType.Light: [Enums.ElementalType.Shadow, Enums.ElementalType.Dimensional],
        Enums.ElementalType.Poison: [Enums.ElementalType.Light, Enums.ElementalType.Arcane],
        Enums.ElementalType.Arcane: [Enums.ElementalType.Light, Enums.ElementalType.Dimensional],
        Enums.ElementalType.Dimensional: [Enums.ElementalType.Light, Enums.ElementalType.Corrupted],
        Enums.ElementalType.Corrupted: [Enums.ElementalType.Light, Enums.ElementalType.Dimensional],
    }

    var resistant_against = {
        Enums.ElementalType.Fire: [Enums.ElementalType.Water],
        Enums.ElementalType.Water: [Enums.ElementalType.Electric],
        Enums.ElementalType.Earth: [Enums.ElementalType.Air],
        Enums.ElementalType.Air: [Enums.ElementalType.Earth],
        Enums.ElementalType.Electric: [Enums.ElementalType.Earth],
        Enums.ElementalType.Ice: [Enums.ElementalType.Fire],
        Enums.ElementalType.Shadow: [Enums.ElementalType.Light],
        Enums.ElementalType.Light: [Enums.ElementalType.Arcane],
        Enums.ElementalType.Poison: [Enums.ElementalType.Earth],
        Enums.ElementalType.Arcane: [Enums.ElementalType.Shadow],
        Enums.ElementalType.Dimensional: [Enums.ElementalType.Arcane],
        Enums.ElementalType.Corrupted: [Enums.ElementalType.Shadow],
    }
    if target_element in effective_against.get(attack_element, []):
        return 1.5
    elif target_element in resistant_against.get(attack_element, []):
        return 0.5
    return 1.0
