extends Node2D
@onready var map_designs = $MapDesigns

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func generateMap(type : bool):
	var map = map_designs.getMap()
	return map

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	map_designs.getMap()
	pass
