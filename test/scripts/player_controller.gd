extends CharacterBody2D
class_name PlayerController

@export var move_speed = 20.0
@export var sprint_increase = 1.5
@export var global_position_exported: Vector2

var direction : Vector2
var sprinting = false
var sprint_multiplier = 1.0

enum Facing {UP, DOWN, LEFT, RIGHT}
var player_facing : Facing

func  _physics_process(delta):
	if Input.is_action_pressed("move_up"):
		direction.y = -1
		player_facing = Facing.UP
	elif  Input.is_action_pressed("move_down"):
		direction.y = 1
		player_facing = Facing.DOWN
	else:
		direction.y =0
	
	if Input.is_action_pressed("move_left"):
		direction.x = -1
		player_facing = Facing.LEFT
	elif Input.is_action_pressed("move_right"):
		direction.x = 1
		player_facing = Facing.RIGHT
	else:
		direction.x = 0
		
	if Input.is_action_pressed("sprint"):
		sprint_multiplier = sprint_increase
		sprinting = true
	else:
		sprint_multiplier = 1.0
		sprinting = false
	
	direction = direction.normalized()	
	velocity = direction * move_speed * delta * 200 * sprint_multiplier
	move_and_slide()



func _process(_delta):
	global_position_exported = global_position
