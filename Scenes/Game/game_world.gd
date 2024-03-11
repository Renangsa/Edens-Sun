extends Node2D

@onready var tile_map : TileMap = $level_farm/TileMap 

var ground_layer = 0
var overground_layer = 1
var environment_layer = 2
var can_place_seeds_custom_data = "can_place_seeds"
var can_place_dirt_custom_data = "can_place_tiles"

enum FARMING_MODE {SEED, DIRT}
var farming_mode = FARMING_MODE.DIRT
var dirt_tiles = []

func _input(_event):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().change_scene_to_file("res://Scenes/Menus/MainMenu/mainmenu.tscn")
	if Input.is_action_just_pressed("toggle_dirt"):
		farming_mode = FARMING_MODE.DIRT
	if Input.is_action_just_pressed("toggle_seed"):
		farming_mode = FARMING_MODE.SEED
	if Input.is_action_just_pressed("click"):
		
		var mouse_pos = get_global_mouse_position()
		var tile_mouse_pos : Vector2i = tile_map.local_to_map(mouse_pos)
		
		if farming_mode == FARMING_MODE.SEED:
			var atlas_coord : Vector2i = Vector2i(0,3)
			if retrieving_custom_data(tile_mouse_pos, can_place_seeds_custom_data, overground_layer):
				var level : int = 0
				var final_seed_level : int = 3
				handle_seed(tile_mouse_pos, level, atlas_coord, final_seed_level)
		elif farming_mode == FARMING_MODE.DIRT:
			if retrieving_custom_data(tile_mouse_pos, can_place_dirt_custom_data, ground_layer):
				dirt_tiles.append(tile_mouse_pos)
				tile_map.set_cells_terrain_connect(overground_layer, dirt_tiles, 1, 0)
				
		
func retrieving_custom_data(tile_mouse_pos, custom_data_layer, layer):
	var tile_data : TileData = tile_map.get_cell_tile_data(layer, tile_mouse_pos)
	if tile_data:
		return tile_data.get_custom_data(custom_data_layer)
	else:
		return false
		
func handle_seed(tile_map_pos, level, atlas_coord, final_seed_level):
	var source_id : int = 20
	tile_map.set_cell(environment_layer, tile_map_pos, source_id, atlas_coord)
	await get_tree().create_timer(5.0).timeout
	
	if level == final_seed_level:
		return 
	else:
		var new_atlas : Vector2i = Vector2i(atlas_coord.x +1, atlas_coord.y)
		handle_seed(tile_map_pos, level+1, new_atlas, final_seed_level)
