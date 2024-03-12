extends CharacterBody2D

#@onready var player = "res://Scenes/Game/Player/player.tscn"#get_node("res://Scenes/Game/Player/player.tscn")
@onready var enemy_animation = $AnimatedSprite2D
@export var speed : int = 40
var player_chase = false
@onready var player = get_parent().get_node("Player")
var target_position

func _ready():
	enemy_animation.play("idle")

func _physics_process(_delta):
	if player_chase:
		target_position = (player.position - position).normalized()
		velocity = target_position * speed
		move_and_slide()
		enemy_animation.play("bouncing")
	else:
		enemy_animation.play("idle")


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		#player = body
		player_chase = true

	
#func damage():
	#enemy_animation.play("Hit")
	#queue_free()
	#enemy_animation.play("Hit")



