extends Node2D
@onready var map_designs = $MapDesigns
var map = [[0,0,0],
[0,0,0],
[0,0,0]]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func generateMap(width : int, height : int):
	map.clear()
	for y in range(height):
		var row = []
		for x in range(width):
			var segment = map_designs.getMap()
			row.append(segment)
		map.append(row)
func getMap():
	return map

func getMapRows():
	return map.size()
func getMapColoumn():
	return map[0].size()	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	map_designs.getMap()
	pass
