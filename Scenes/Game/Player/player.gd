extends CharacterBody2D

@export var SPEED: int = 150

func _ready():
	$SpritePlayer/AnimationPlayer.play("idle")

func get_input():
	var input_direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = input_direction * SPEED
	
func _physics_process(_delta):
	get_input()
	move_and_slide()
