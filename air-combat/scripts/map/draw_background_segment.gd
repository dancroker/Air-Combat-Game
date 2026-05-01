extends TileMapLayer

var location = Vector2i(0,0)
var atlas_coords = Vector2i (1,16)
@onready var map_generation = $MapGen

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var map = map_generation.generateMap(0)
	for x in range(3):
		for y in range(3):
			if map[x][y] != 0:
				location = Vector2i(x,y)
				placeTile(location,atlas_coords)
	pass # Replace with function body.

func placeTile(pos: Vector2i,atlas_loc: Vector2i):
	set_cell(location,0,atlas_coords)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
