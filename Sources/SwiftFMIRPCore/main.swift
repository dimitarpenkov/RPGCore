var mapGenerator = StandartMapGenerator()
var playerGenerator = StandartPlayerGenerator(heroGenerator: StandartHeroGenerator())
//var figthGenerator = DefaultFightGenerator()
//var equipmentGenerator = DefaultEquipmentGenerator()
var mapRenderer = StandartMapRender()
var game = Game(mapGenerator: mapGenerator, playerGenerator: playerGenerator, mapRenderer: mapRenderer)

game.run()
