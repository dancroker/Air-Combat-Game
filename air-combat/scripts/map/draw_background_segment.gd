extends TileMapLayer

var location = Vector2i(0,0)
var atlas_coords = Vector2i (1,16)
@onready var map_generation = $MapGen

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	map_generation.generateMap(4,4)
	for x in range(map_generation.getMapRows()):
		for y in range(map_generation.getMapColoumn()):
			
			var map_segment = map_generation.getMap()[x][y]
			
			for indi_x in range(map_segment.size()):
				for indi_y in range(map_segment[0].size()):
					
					if map_segment[indi_x][indi_y] != 0:
						location = Vector2i(indi_y+(y*map_segment.size()),indi_x+(x*map_segment[0].size()))
						placeTile(location,atlas_coords)
						

func placeTile(pos: Vector2i,atlas_loc: Vector2i):
	set_cell(pos,0,atlas_loc)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
