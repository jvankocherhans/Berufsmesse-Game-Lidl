extends Node3D

@export var color = Color(255, 0, 0 , 1)

@onready var car_body = $Sketchfab_model/root/GLTF_SceneRootNode/Cube_0/Object_4

func _ready():
		# get active material
	var material = car_body.get_active_material(0)
	material.albedo_color = color
	car_body.set_surface_override_material(0, material)
	## IMPORTANT: Material is shared, therefore activate flag: local to scene!!




