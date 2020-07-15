protocol Weapon {
    var attack: Int {get}
    var defence: Int {get}
}

struct HumanAxe: Weapon {
    var attack: Int
    
    var defence: Int
    
    init() {
        self.attack = 10
        self.defence = 0
    }
}

struct ElfBow: Weapon {
    var attack: Int
    var defence: Int
    
    init() {
        self.attack = 15
        self.defence = 0
    }
}

struct WizardRod: Weapon {
    var attack: Int
    var defence: Int
    
    init() {
        self.attack = 20
        self.defence = 0
    }
}

