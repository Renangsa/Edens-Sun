extends Node
class_name HealthComponent
@export var max_health := 100
var current_health: int

func _ready():
	current_health = max_health

func take_damage(damage: int):
	current_health -= damage
	if current_health <= 0:
		die()

func die():
	get_parent().queue_free()
	get_tree().change_scene_to_file("res://Scenes/Menus/MainMenu/mainmenu.tscn")
	
