extends Node2D

func _input(ev):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().change_scene_to_file("res://Scenes/Menus/MainMenu/mainmenu.tscn")
