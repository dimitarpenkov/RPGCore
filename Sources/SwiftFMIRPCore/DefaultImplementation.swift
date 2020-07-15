//struct DefaultHero: Hero {
//   var race: String  = "Random Race"
//
//    var energy: Int = 5
//    var lifePoints: Int = 7
//
//    var weapon: Weapon?  = nil
//    var armor: Armor? = nil
//    mutating func reduceEnergy() {
//        energy -= 1
//    }
//}
//
//struct NoArmor: Armor {
//    var attack: Int = 0
//    var defence: Int = 0
//}
//
//struct WoodenStick: Weapon {
//    var attack: Int = 2
//    var defence: Int = 1
//}
//
//
//
////class DefaultPlayer: Player {
////    var name: String = "Default Player"
////    var hero: Hero = DefaultHero()
////    var isAlive: Bool  = true
////    func reduceEnergy() {
////        hero.energy -= 1
////    }
////    var currentPosition: (Int, Int)
////}
//
//struct DefaultPlayerGenerator: PlayerGenerator {
//    var heroGenerator: StandartHeroGenerator
//    
//    init(heroGenerator: StandartHeroGenerator) {
//        self.heroGenerator = heroGenerator
//    }
//    
//    init(heroGenerator: HeroGenerator) {
//        self.heroGenerator = heroGenerator as! StandartHeroGenerator
//    }
//    
//    func generatePlayer(name: String) -> Player {
//        var player = DefaultPlayer()
//        player.name = name
//        player.hero = heroGenerator.getRandom()
//        return player
//    }
//}
//
//struct DefaultHeroGenerator: HeroGenerator {
//    func getRandom() -> Hero {
//        return DefaultHero()
//    }
//}
//
//struct DefaultMapGenerator : MapGenerator {
//    func generate(players: [Player]) -> Map {
//        return DefaultMap(players: players)
//    }
//}
//class DefaultMapTile: MapTile {
//    var type: MapTileType
//    var state: String
//    
//    init(type: MapTileType) {
//        self.type = type
//        state = ""
//    }
//}
////
////class DefaultMap : Map {
////    var height: Int
////
////    var width: Int
////
////    required init(players: [Player]) {
////        self.players = players
////        self.height = 3
////        self.width = 3
////    }
////
////    var players: [Player]
////    var maze: [[MapTile]] = [
////        [DefaultMapTile(type: .wall), DefaultMapTile(type: .wall), DefaultMapTile(type: .wall),DefaultMapTile(type: .wall), DefaultMapTile(type: .wall), DefaultMapTile(type: .wall), DefaultMapTile(type: .wall)],
////
////        [DefaultMapTile(type: .wall), DefaultMapTile(type: .empty), DefaultMapTile(type: .wall),DefaultMapTile(type: .rock), DefaultMapTile(type: .chest), DefaultMapTile(type: .empty), DefaultMapTile(type: .wall)],
////
////        [DefaultMapTile(type: .wall), DefaultMapTile(type: .empty), DefaultMapTile(type: .wall),DefaultMapTile(type: .wall), DefaultMapTile(type: .wall), DefaultMapTile(type: .wall), DefaultMapTile(type: .wall)],
////
////        [DefaultMapTile(type: .wall), DefaultMapTile(type: .wall), DefaultMapTile(type: .wall),DefaultMapTile(type: .wall), DefaultMapTile(type: .wall), DefaultMapTile(type: .wall), DefaultMapTile(type: .wall)],
////
////        [DefaultMapTile(type: .wall), DefaultMapTile(type: .wall), DefaultMapTile(type: .wall),DefaultMapTile(type: .wall), DefaultMapTile(type: .wall), DefaultMapTile(type: .wall), DefaultMapTile(type: .wall)],
////
////        [DefaultMapTile(type: .wall), DefaultMapTile(type: .wall), DefaultMapTile(type: .wall),DefaultMapTile(type: .wall), DefaultMapTile(type: .wall), DefaultMapTile(type: .wall), DefaultMapTile(type: .wall)]
////
////    ]
////
////    func availableMoves(player: Player) -> [PlayerMove] {
////        return []
////    }
////
////    func move(player: Player, move: PlayerMove) {
////       //ТОДО: редуцирай енергията на героя на играча с 1
////        player.reduceEnergy()
////
////    }
////
////}
//
//class DefaultFightGenerator : FightGenerator {
//    //TBD
//}
//
//class DefaultEquipmentGenerator : EquipmentGenerator {
//    var allArmors: [Armor]
//    
//    var allWeapons: [Weapon]
//    
//    init() {
//        allArmors = [NoArmor()]
//        allWeapons = [WoodenStick()]
//    }
//}
//
//class DefaultMapRenderer: MapRenderer {
//    func render(map: Map) {
//        for row in map.maze {
//            self.renderMapRow(row: row)
//        }
//        renderMapLegend()
//    }
//    
//    private func renderMapRow(row: [MapTile]) {
//        var r = ""
//        for tile in row {
//            switch tile.type {
//            case .chest:
//                r += "📦"
//            case .rock:
//                r += "🗿"
//            case .teleport:
//                r += "💿"
//            case .empty:
//                r += "  "
//            case .wall:
//                r += "🧱"
//            default:
//                //empty
//                r += " "
//            }
//        }
//        
//        print("\(r)")
//    }
//    
//    private func renderMapLegend() {
//        print("no legend yet")
//    }
//}
