extends Node3D

@export var body_color = Color(255, 0, 0, 1)
@export var stripe_color = Color(255, 0, 0, 1)

@onready var car_body_base = $"Sketchfab_model/1e8d01e715f34909aa0437528e160b3d_fbx/RootNode/CarBody/CarBody_Carcamero_ma_0"
@onready var car_body_stripe = $"Sketchfab_model/1e8d01e715f34909aa0437528e160b3d_fbx/RootNode/CarBody/CarBody_Material_028_0"


func _ready():
		# get active material
	var material_car_body_base = car_body_base.get_active_material(0)
	var material_car_body_stripe = car_body_stripe.get_active_material(0)
	# Change it to set color value
	material_car_body_base.albedo_color = body_color
	material_car_body_stripe.albedo_color = stripe_color
	# Setting material for whole car (body and mirror)
	car_body_base.set_surface_override_material(0, material_car_body_base)
	car_body_stripe.set_surface_override_material(0, car_body_stripe)

	## IMPORTANT: Material is shared, therefore activate flag: local to scene!!
