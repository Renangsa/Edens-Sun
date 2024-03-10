extends CharacterBody2D

@export var SPEED: int = 150
@onready var player_animation = $SpritePlayer/AnimationPlayer
var look_direction = "down"

func update_animation():
	if velocity.length() == 0:
		player_animation.play("idle_" + look_direction)
	else:
		if velocity.x > 0: look_direction = "right"
		elif velocity.x < 0: look_direction = "left"
		elif velocity.y < 0 : look_direction = "up"
		elif velocity.y > 0 : look_direction = "down"
		player_animation.play("walking_" + look_direction)
	

func get_input():
	var input_direction = Input.get_vector("LEFT","RIGHT","UP","DOWN")
	velocity = input_direction * SPEED

	
func _physics_process(_delta):
	get_input()
	move_and_slide()
	update_animation()
