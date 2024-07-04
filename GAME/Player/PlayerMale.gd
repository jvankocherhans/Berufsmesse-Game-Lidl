extends Player


@onready var eyes = $Armature/Skeleton3D/eyes
@onready var eyes2 = $"Armature/Skeleton3D/Augen_leicht_grünlich"
@onready var hair = $Armature/Skeleton3D/hair
@onready var skin = $Armature/Skeleton3D/Haut
@onready var shoes = $Armature/Skeleton3D/Schuhe_rot

func  _ready():
	generate_custom_look()

func generate_custom_look():
	var material_eyes = eyes.get_active_material(0)
	var material_hair = hair.get_active_material(0)
	var material_skin = skin.get_active_material(0)
	var material_shoes = shoes.get_active_material(0)
	
	material_eyes.albedo_color = eye_colors[randi() % eye_colors.size()]
	material_hair.albedo_color =  hair_colors[randi() % hair_colors.size()]
	material_skin.albedo_color = skin_colors[randi() % skin_colors.size()]
	material_shoes.albedo_color = shoe_colors[randi() % shoe_colors.size()]
	
	eyes.set_surface_override_material(0, material_eyes)
	eyes2.set_surface_override_material(0, material_eyes)
	hair.set_surface_override_material(0, material_hair)
	skin.set_surface_override_material(0, material_skin)
	shoes.set_surface_override_material(0, material_shoes)

