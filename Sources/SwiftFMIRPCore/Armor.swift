protocol Armor {
    var attack: Int {get}
    var defence: Int {get}
}

//different armors for different races

struct HumanfVest: Armor {
    var attack: Int
    var defence: Int
    init() {
        self.attack = 0
        self.defence = 10
    }
}

struct ElfMantle: Armor {
    var attack: Int
    var defence: Int
    init() {
        self.attack = 0
        self.defence = 15
    }
}

struct WizardRobe: Armor {
    var attack: Int
    var defence: Int
    init() {
        self.attack = 0
        self.defence = 12
    }
}
