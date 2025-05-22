extends CharacterBody2D

@onready var detection_circle = $detection_circle
var player: Node2D = null
@export var move_speed: float = 100.0

func _ready():
	detection_circle.connect("body_entered", _on_body_entered)
	detection_circle.connect("body_exited", _on_body_exited)

func _physics_process(_delta):
	if player:
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * move_speed
		move_and_slide()
	else:
		velocity = Vector2.ZERO
		move_and_slide()

func _on_body_entered(body):
	if body.name == "Player":  # or `body.is_in_group("player")` if using groups
		player = body

func _on_body_exited(body):
	if body == player:
		player = null
