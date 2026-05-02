extends Node2D

var enemy_basic = preload("res://basicenemy.tscn")
@export var player : CharacterBody2D
var timer = 100
var max_timer = 200



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func create_basic_enemy():
	var enemys = enemy_basic.instantiate()
	enemys.start_posisition = Vector2(100,100)
	enemys.player = player
	get_parent().add_child(enemys)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (timer < 0):
		create_basic_enemy()
		timer = max_timer
	else:
		timer -= 1
	pass
