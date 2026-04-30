extends CharacterBody2D

@export var speed = 400
@export var rotation_speed = 1.5
@export var engine_force = 50
@export var engine_change_force = 10

var rotation_direction = 0

func get_input():
	rotation_direction = Input.get_axis("right", "left")
	#velocity = transform.x * Input.get_axis("down", "up") * speed
	var input_direction = Input.get_axis("up", "down") #,-y , 
	if input_direction != 0:
		if input_direction > 0:
				engine_force -= engine_change_force
		else:
			engine_force += engine_change_force
	velocity = transform.x * engine_force

func _physics_process(delta):
	get_input()
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()
#@export var speed = 400
#@export var engine_force = 50
#@export var engine_change_force = 10
#@export var rotation_speed = 1.5
#
#var rotation_direction = 0
#
#func get_input():
	#var input_direction = Input.get_axis("up", "down") #,-y , 
	#rotation_direction = Input.get_axis("left", "right")
	##velocity = input_direction * speed
	#if input_direction != 0:
		#if input_direction > 0:
				#engine_force -= engine_change_force
		#else:
			#engine_force += engine_change_force
	#velocity.y = engine_force
	#
#
#func _physics_process(delta):
	#get_input()
	#rotation += rotation_direction * rotation_speed * delta
	#move_and_slide()
