extends CharacterBody2D

@export var player : CharacterBody2D
@export var speed : int
@export var turn_speed : float


func _ready():
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
