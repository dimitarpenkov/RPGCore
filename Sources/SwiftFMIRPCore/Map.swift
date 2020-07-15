protocol Map {
    init(players: [Player])
    var players: [Player] {get}
    var maze: [[MapTile]] {get set}
    var height: Int {get}
    var width: Int {get}
    func availableMoves(player: StandartPlayer) -> [PlayerMove]
    func move(player: StandartPlayer, move: PlayerMove)
}

protocol MapRenderer {
    func render(map:Map)
}

protocol PlayerMove {
    var direction: MapMoveDirection {get set}
    var friendlyCommandName: String {get set}
}

class StandartPlayerMove: PlayerMove {
    var direction: MapMoveDirection
    
    var friendlyCommandName: String
    
    init(direction: MapMoveDirection) {
        self.direction = direction
        switch self.direction {
        case .up:
            friendlyCommandName = "up"
        case .down:
            friendlyCommandName = "down"
        case .left:
            friendlyCommandName = "left"
        case .right:
            friendlyCommandName = "right"
        }
    }
}

extension PlayerMove {
    var allMoves: [PlayerMove] {
        return [
        StandartPlayerMove(direction: .up),
        StandartPlayerMove(direction: .down),
        StandartPlayerMove(direction: .left),
        StandartPlayerMove(direction: .right)
        ]
    }
}

enum MapMoveDirection {
    case up
    case down
    case left
    case right
}

protocol MapTile {
    var type: MapTileType {get set}
    var state: String {get set}
}

enum MapTileType {
    case empty
    case chest
    case wall
    case teleport
    case rock
    case arcade
    case robot
    case alien
    case pumpkin
    case clown
}

protocol MapGenerator {
    func generate(players:[Player]) -> Map
}


class StandartMap: Map {
    func availableMoves(player: StandartPlayer) -> [PlayerMove] {
        let playerMoves = [PlayerMove]()
        return playerMoves
    }
    
    
    var maze: [[MapTile]]
    
    required init(players: [Player]) {
        self.players = players
        let maze = [[StandartMapTile]]()
        self.maze = maze
        self.height = 0
        self.width = 0
    }
    
    var players: [Player]
    var height: Int
    var width: Int
    
    
    func availableMoves(player: Player) -> [PlayerMove] {
        let playerMoves = [PlayerMove]()
        
        return playerMoves
    }
    
    func move(player: StandartPlayer, move: PlayerMove) {
        let currentPosition = player.currentPosition
        switch move.direction {
        case .up:
            let upperTileX = currentPosition.0 - 1 // row
            let upperTileY = currentPosition.1 // col
            if maze[upperTileX][upperTileY].type == .empty && upperTileX != 0 {
                player.currentPosition = (upperTileX, upperTileY)
            }
        case .left:
            let leftTileX = currentPosition.0
            let leftTileY = currentPosition.1 - 1
            if maze[leftTileX][leftTileY].type == .empty && leftTileY != 0 {
                player.currentPosition = (leftTileX, leftTileY)
            }
        case .right:
            let rightTileX = currentPosition.0
            let rightTileY = currentPosition.1 + 1
            if maze[rightTileX][rightTileY].type == .empty && rightTileY < width{
                player.currentPosition = (rightTileX, rightTileY)
            }
        default:
            let downTileX = currentPosition.0 + 1
            let downTileY = currentPosition.1
            if maze[downTileX][downTileY].type == .empty && downTileX < height {
                player.currentPosition = (downTileX, downTileY)
            }
        }
        print(player.currentPosition)
    }
    
    func checkIfAvailableToMove(currentPosition: (Int, Int), positionToGo: (Int, Int)) {
        
    }
}

class StandartMapTile: MapTile {
    var type: MapTileType
    var state: String
    
    init(type: MapTileType, state: String) {
        self.type = type
        self.state = state
    }
    
    
}

class StandartMapGenerator: MapGenerator {
    func generate(players: [Player]) -> Map {
        var height : Int = 0
        var width: Int = 0
        let map = StandartMap(players: players)
        for _ in 1...players.count {
            height += 2
            width += 2
        }
        map.height = height
        map.width = width
        var maze = [[MapTile]]()
        for row in 0..<height {
            maze.append([StandartMapTile]())
            for _ in 0..<width {
                let randomTile = Int.random(in: 1...100)
                switch randomTile {
                case 1..<50:
                    maze[row].append(StandartMapTile(type: .empty, state: "non-special"))
                case 50..<60:
                    maze[row].append(StandartMapTile(type: .rock, state: "special"))
                case 60..<70:
                    maze[row].append(StandartMapTile(type: .teleport, state: "special"))
                case 70..<80:
                    maze[row].append(StandartMapTile(type: .chest, state: "special"))
                default:
                    maze[row].append(StandartMapTile(type: .wall, state: "non-speicial"))
                }
                
            }
        }
        map.maze = maze
        
        
        return map
    }
    
    
    func checkAvailablePlacesToSpawn(maze: [[MapTile]]) -> [(Int, Int)] {
        var availablePlaces = [(Int, Int)]()
        for row in 0..<maze.capacity {
            for tile in 0..<maze[row].capacity {
                if maze[row][tile].type == .empty {
                    availablePlaces.append((row, tile))
                }
            }
        }
        return availablePlaces
    }
    
    func placePlayersRandomlyOnMap(players: [StandartPlayer], maze: [[StandartMapTile]]) {
        var placesWherePlayersSpawn = [(Int, Int)]()
        var availablePlaces: [(Int, Int)] = checkAvailablePlacesToSpawn(maze: maze)
        for player in players {
            if let randomPosition = availablePlaces.randomElement() {
                player.currentPosition = randomPosition
                placesWherePlayersSpawn.append(randomPosition)
                putPlayerOnTile(maze: maze, position: randomPosition, player: player)
                
            }
        }
    }
    
    func putPlayerOnTile(maze: [[StandartMapTile]], position: (Int, Int), player: StandartPlayer) {
        for row in 0..<maze.count {
            for tile in 0..<maze[row].count {
                if (row, tile) == position {
                    switch player.avatar{
                    case "👾":
                        maze[row][tile].type = .arcade
                    case "🤖":
                        maze[row][tile].type = .robot
                    case "👽":
                        maze[row][tile].type = .alien
                    case "🎃":
                        maze[row][tile].type = .pumpkin
                    default:
                        maze[row][tile].type = .clown
                    }
                }
            }
        }
    }
}

class StandartMapRender: MapRenderer {
    func render(map: Map) {
        let maze = map.maze
        for row in maze {
            renderRow(row: row)
        }
    }
    
    private func renderRow(row: [MapTile]) {
        var r = ""
        for tile in row {
            switch tile.type {
            case .chest:
                r += "📦"
            case .rock:
                r += "💎"
            case .teleport:
                r += "💿"
            case .empty:
                r += "  "
            case .wall:
                r += "🧱"
            case .arcade:
                r += "👾"
            case .robot:
                r += "🤖"
            case .alien:
                r += "👽"
            case .pumpkin:
                r += "🎃"
            case .clown:
                r += "🤡"
            default:
                r += " "
            }
        }
        
        print("\(r)")
    }
    
    func renderMapLegend() {
        let legend = """
            Легенда:
            📦 - кутия, в която можете да откриете оръжие или броня
            💎 - скала, от която можете да получите бонус точка енергия
            💿 - телепорт, чрез който можете да преминете три полета напред, в която и да е посока
            свободно поле - можете да преминете свободно върху него ако имате енергия
            🧱 - стена - от тук не можете да преминете
        """
        print(legend)
    }

}


