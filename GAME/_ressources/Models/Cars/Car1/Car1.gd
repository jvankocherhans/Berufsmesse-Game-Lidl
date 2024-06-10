extends Node3D

@export var color = Color(255, 0, 0, 1)

@onready var mirror_body = $"Sketchfab_model/9d0a5fca1a504ad3a3ed79e6386fe05b_fbx/RootNode/Car/Mirror_001/Mirror_Body"
@onready var car_body = $"Sketchfab_model/9d0a5fca1a504ad3a3ed79e6386fe05b_fbx/RootNode/Car/Car_Body"

func _ready():
	# get active material
	var material_car_body = car_body.get_active_material(0)
	var material_car_mirror = mirror_body.get_active_material(0)
	# Change it to set color value
	material_car_body.albedo_color = color
	material_car_mirror.albedo_color = color
	# Setting material for whole car (body and mirror)
	car_body.set_surface_override_material(0, material_car_body)
	mirror_body.set_surface_override_material(0, material_car_mirror)
	
	## IMPORTANT: Material is shared, therefore activate flag: local to scene!!

