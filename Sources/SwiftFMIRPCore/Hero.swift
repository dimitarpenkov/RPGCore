protocol Hero {
    var race: String {get}

    var energy: Int {get set}
    var lifePoints: Int {get set}

    var weapon: Weapon? {get set}
    var armor: Armor? {get set}
    mutating func reduceEnergy()
}


protocol HeroGenerator {
    func getRandom() -> Hero
}

protocol Fight {
    var attacker: Hero {get set}
    var host: Hero {get set}
    
    func start(finish:(Fight) -> ())
    var winner: Hero {get set}
}

protocol FightGenerator {
    
}

protocol EquipmentGenerator {
    var allArmors: [Armor] {get}
    var allWeapons: [Weapon] {get}
}


class StandartHero: Hero {
    var race: String
    
    var energy: Int
    
    var lifePoints: Int
    
    var weapon: Weapon?
    
    var armor: Armor?
    
    func reduceEnergy() {
        self.energy -= 1
    }
    
    init(race: String, energy: Int, lifePoints: Int, weapon: Weapon?, armor: Armor?) {
        self.race = race
        self.energy = energy
        self.lifePoints = lifePoints
        self.weapon = weapon
        self.armor = armor
    }
}

//generating random races for each player

class StandartHeroGenerator: HeroGenerator {
    func getRandom() -> Hero {
        var hero = StandartHero(race: "", energy: 0, lifePoints: 0, weapon: nil, armor: nil)
        let randomNumber = Int.random(in: 1...3)
        switch randomNumber {
        case 1:
            let axe = HumanAxe()
            let armor = HumanfVest()
            hero = StandartHero(race: "human", energy: 10, lifePoints: 100, weapon: axe , armor: armor)
        case 2:
            let bow = ElfBow()
            let mantle = ElfMantle()
            hero = StandartHero(race: "elf", energy: 12 , lifePoints: 80, weapon: bow, armor: mantle)
        default:
            let rod = WizardRod()
            let robe = WizardRobe()
            hero = StandartHero(race: "wizard", energy: 11, lifePoints: 20, weapon: rod, armor: robe)
        }
        return hero
    }
    
    
}

