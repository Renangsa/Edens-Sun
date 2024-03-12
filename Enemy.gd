extends CharacterBody2D

var health = 1

@onready var player = get_node("/root/Game_test/Player")
@onready var enemy_animation = $AnimatedSprite2D

func _ready():
	enemy_animation.play("bouncing")

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction *50.0
	move_and_slide()

func damage():
	health -= 1
	enemy_animation.play("Hit")
	if health == 0:
		queue_free()
		enemy_animation.play("Hit")
	
	

