extends CharacterBody3D

class_name Player

@export var speed = 8.0
@export var slide_speed = 6.0
@export var gravity = 70

@onready var pivot = $Armature
@onready var animation_player = $AnimationPlayer

@export var isFreezed = false

@export var is_sliding = false

var score = 0;
var last_vector_direction = Vector3.ZERO


var skin_colors = [
	Color(241/255.0, 194/255.0, 125/255.0, 1),  # Fair skin tone
	Color(224/255.0, 172/255.0, 105/255.0, 1),  # Medium skin tone
	Color(198/255.0, 134/255.0, 66/255.0, 1),   # Olive skin tone
	Color(141/255.0, 85/255.0, 36/255.0, 1),    # Brown skin tone
	Color(92/255.0, 51/255.0, 23/255.0, 1)      # Dark skin tone
]

var hair_colors = [
	Color(0, 0, 0, 1),                         # Black
	Color(75/255.0, 54/255.0, 33/255.0, 1),    # Dark Brown
	Color(139/255.0, 69/255.0, 19/255.0, 1),   # Brown
	Color(210/255.0, 180/255.0, 140/255.0, 1), # Light Brown
	Color(255/255.0, 223/255.0, 196/255.0, 1), # Blonde
	Color(255/255.0, 0, 0, 1),                 # Red
	Color(0, 128/255.0, 0, 1),                 # Dark Green
	Color(46/255.0, 139/255.0, 87/255.0, 1),   # Sea Green
	Color(188/255.0, 143/255.0, 143/255.0, 1), # Rosy Brown
	Color(128/255.0, 0, 128/255.0, 1),         # Purple
	Color(255/255.0, 165/255.0, 0, 1)          # Orange
]


var eye_colors = [
	Color(0, 0, 0, 1),        # Black
	Color(64/255.0, 64/255.0, 64/255.0, 1),     # Dark Grey
	Color(102/255.0, 51/255.0, 0, 1),     # Dark Brown
	Color(139/255.0, 69/255.0, 19/255.0, 1),    # Brown
	Color(85/255.0, 107/255.0, 47/255.0, 1),    # Hazel
	Color(34/255.0, 139/255.0, 34/255.0, 1),    # Green
	Color(0, 128/255.0, 128/255.0, 1),    # Teal
	Color(0, 0, 255/255.0, 1),      # Blue
	Color(70/255.0, 130/255.0, 180/255.0, 1),   # Steel Blue
	Color(173/255.0, 216/255.0, 230/255.0, 1)   # Light Blue
]

var shoe_colors = [
	Color(0, 0, 0, 1),         # Black
	Color(105/255.0, 105/255.0, 105/255.0, 1),   # Dark Grey
	Color(169/255.0, 169/255.0, 169/255.0, 1),   # Light Grey
	Color(139/255.0, 69/255.0, 19/255.0, 1),     # Brown
	Color(160/255.0, 82/255.0, 45/255.0, 1),     # Sienna
	Color(210/255.0, 105/255.0, 30/255.0, 1),    # Chocolate
	Color(255/255.0, 0, 0, 1),       # Red
	Color(0, 0, 255/255.0, 1),       # Blue
	Color(0, 128/255.0, 0, 1),       # Green
	Color(255/255.0, 165/255.0, 0, 1),     # Orange
	Color(128/255.0, 0, 128/255.0, 1)      # Purple
]

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	animation_player.play("idle")
	isFreezed = false

func _physics_process(delta):
	var input_vector = get_input_vector()
	
	if input_vector != Vector3.ZERO:
		last_vector_direction = input_vector
	
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	
	if Input.is_action_just_pressed("slide"):
		slide(input_vector)
	else:
		apply_movement(input_vector)
	
	apply_gravity(delta)
	move_and_slide()

func get_input_vector():
	var input_vector = Vector3.ZERO
	input_vector.z = Input.get_action_strength("forward") - Input.get_action_strength("back")
	input_vector.x = Input.get_action_strength("right") -  Input.get_action_strength("left") 
	return input_vector.normalized()
	
func apply_movement(input_vector):
	if (!isFreezed):
		velocity.z = input_vector.x * speed
		velocity.x = input_vector.z * speed
		if(velocity != Vector3.ZERO):
			animation_player.play("run")
		else:
			animation_player.play("idle")
	
	# rotateing character
	if input_vector != Vector3.ZERO && !isFreezed:
		pivot.look_at(position + Vector3(input_vector.x, input_vector.y, -input_vector.z), Vector3.UP)

func slide(input_vector):
	velocity.z = last_vector_direction.x * slide_speed
	velocity.x = last_vector_direction.z * slide_speed
	animation_player.play("slide")
	

func apply_gravity(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta


	
		
