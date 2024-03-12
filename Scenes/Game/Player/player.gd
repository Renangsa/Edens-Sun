extends CharacterBody2D


@export var SPEED: int = 150
@onready var player_animation = $AnimationPlayer
var input_direction : Vector2 = Vector2.ZERO
var look_direction = "down"
var in_action = false

func handleInput():
	input_direction = Input.get_vector("LEFT","RIGHT","UP","DOWN").normalized()
	velocity = input_direction * SPEED
	
	if Input.is_action_just_pressed("click"):
		player_animation.play("axe_"+look_direction)
		in_action = true
		await player_animation.animation_finished
		in_action = false
	elif Input.is_action_just_pressed("click"):
		player_animation.play("hoe_"+look_direction)
		in_action = true
		await player_animation.animation_finished
		in_action = false
	
func updateAnimation():
	if in_action:
		return
	
	if input_direction:
		
		if velocity.x > 0: look_direction = "right"
		elif velocity.x < 0: look_direction = "left"
		elif velocity.y < 0 : look_direction = "up"
		elif velocity.y > 0 : look_direction = "down"
		player_animation.play("walking_" + look_direction)
	else:
		velocity = Vector2.ZERO
		player_animation.play("idle_" + look_direction)
		

func _physics_process(_delta):
	handleInput()
	if !in_action:
		move_and_slide()
	updateAnimation()
	
