protocol Player {
    var name: String {get set}
    var hero: Hero {get set}
    var isAlive: Bool {get set}
    func reduceEnergy()
    var currentPosition: (Int, Int) {get set}
    func moveToPosition(position: (Int, Int))
}


protocol PlayerGenerator {
    var heroGenerator: StandartHeroGenerator {get set}
    init(heroGenerator: StandartHeroGenerator)
    func generatePlayer(name: String) -> Player
}

class StandartPlayer: Player{
    func moveToPosition(position: (Int, Int)) {
        currentPosition = position
    }
    
    var currentPosition: (Int, Int)
    
    var name: String
    
    var hero: Hero
    
    var isAlive: Bool
    
    func reduceEnergy() {
        
    }
    
    var avatar: String
    
    required init(name: String, hero: StandartHero, isAlive: Bool) {
        self.name = name
        self.hero = StandartHero(race: "", energy: 0, lifePoints: 0, weapon: nil, armor: nil)
        self.isAlive = isAlive
        self.currentPosition = (0, 0)
        self.avatar = "🤡"
    }
    
    
}

class StandartPlayerGenerator: PlayerGenerator {
    var heroGenerator: StandartHeroGenerator
    
    required init(heroGenerator: StandartHeroGenerator) {
        self.heroGenerator = heroGenerator
    }
    
    func generatePlayer(name: String) -> Player {
        let player = StandartPlayer(name: "", hero: StandartHero(race: "", energy: 0, lifePoints: 0, weapon: nil, armor: nil), isAlive: true)
        print("Въведете име на играча: ")
        if let name = readLine() {
            player.name = name
        }
        
        chooseAvatar(player: player)
        
        print("""
            На случаен принцип ще получите някой от следните герои:
        1.Human - 100т. живот, 10т. атака, 20т. защита, 10т. енергия
        2.Elf - 80т. живот, 15. атака, 15т. защита, 12т. енергия
        3.Wizard - 75т. живот, 20т. атака, 12т. защита, 11т. енергия
        """)
        
        var chosenHero = heroGenerator.getRandom()
        switch chosenHero.race {
        case "human":
            chosenHero.lifePoints = 100
        case "elf":
            chosenHero.lifePoints = 80
        default:
            chosenHero.lifePoints = 75
        }
        
        let messageAboutChoice = """
        \(player.name), вие ще играете като \(chosenHero.race) с аватар \(player.avatar)
        Статистики:
        \(chosenHero.lifePoints) HP
        \(String(describing: chosenHero.weapon!.attack)) Attack Damage
        \(String(describing: chosenHero.armor!.defence)) Defence
        \(chosenHero.energy) Energy
    """
        print(messageAboutChoice)
        return player
    }
    
    func chooseAvatar(player: StandartPlayer) {
        let avatars : [String] = ["👾", "🤖", "👽", "🎃"]
        print("Изберете аватар: (")
        for i in 0..<avatars.count {
            print("press \(i): \(avatars[i])")
        }
        
        if let choice = readLine(as: Int.self) {
            if choice >= 0 && choice <= 3 {
                player.avatar = avatars[choice]
            } else {
                player.avatar = "🤡"
            }
        }
    }
    
    
}


