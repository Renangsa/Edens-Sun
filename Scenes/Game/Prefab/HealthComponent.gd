extends Node
class_name HealthComponent
@export var max_health := 100
var current_health: int

func _ready():
	current_health = max_health

func damage(damage: int):
	current_health -= damage
	print(current_health)
	if current_health <= 0:
		get_parent().queue_free()

	
