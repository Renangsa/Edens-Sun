extends Area2D

@export var attack_damage := 10

func _ready():
	area_entered.connect(_on_hurtbox_area_entered)

func _on_hurtbox_area_entered(area: Area2D):
	if area is HurtboxComponent:
		var hurtbox : HurtboxComponent = area
		
		hurtbox.damage(attack_damage)

