extends CharacterBody2D

@export var rotation_speed = 3
@export var engine_force = 50
@export var min_engine_force = 100 #/10
@export var max_engine_force = 300 #/10
@export var engine_change_force = 5

var bullet_path=preload("res://basicbullet.tscn")

var rotation_direction = 0

func get_input():
	rotation_direction = Input.get_axis("left", "right")
	#velocity = transform.x * Input.get_axis("down", "up") * speed
	var input_direction = Input.get_axis("up", "down") #,-y , 
	if input_direction != 0:
		if input_direction > 0:
				engine_force -= engine_change_force
				if engine_force < min_engine_force:
					engine_force = min_engine_force
		else:
			engine_force += engine_change_force
			if engine_force > max_engine_force:
					engine_force = max_engine_force
	velocity = transform.x * engine_force
	
	var shoot = Input.is_action_just_pressed("fire shot")
	if (shoot):
		fire()

func _physics_process(delta):
	get_input()
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()
	
func fire():
	var bullets = bullet_path.instantiate()
	bullets.dir = rotation
	bullets.pos=$"Fire Location".global_position
	bullets.rota=global_rotation
	get_parent().add_child(bullets)
