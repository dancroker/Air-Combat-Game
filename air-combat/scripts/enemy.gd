extends CharacterBody2D

@export var player : CharacterBody2D
@export var speed : int
@export var turn_speed : float
@export var start_posisition : Vector2
@export var fire_speed : float
@export var accuracy : float
var fire_time : float

var bullet_path=preload("res://enemybullet.tscn")


func _ready():
	position = start_posisition
	fire_time = fire_speed
	pass

func _physics_process(delta):
	if player == null:
		return
	var direction = player.global_position - global_position
	var target_angle = direction.angle()
	var turn_speed_change = randf_range(turn_speed/2,turn_speed)
	rotation = lerp_angle(rotation, target_angle, turn_speed_change * delta)

	velocity = (Vector2.RIGHT.rotated(rotation) * speed)
	move_and_slide()
	
	fire_time -= delta
	if fire_time <= 0:
		fire()
		fire_time = fire_speed

func fire():
	var bullets = bullet_path.instantiate()
	var random_vairance = randf_range(-accuracy,accuracy)
	bullets.dir = rotation+random_vairance
	bullets.pos=$"Fire Location".global_position
	bullets.rota=global_rotation
	get_parent().add_child(bullets)

func _on_area_2d_body_entered(body: Node2D) -> void:
	queue_free()
	pass # Replace with function body.
