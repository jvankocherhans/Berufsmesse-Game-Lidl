extends CharacterBody3D

class_name Player

@export var speed = 2.0
@export var gravity = 70

@onready var pivot = $Pivot

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta):
	var input_vector = get_input_vector()
	
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

	apply_movement(input_vector)
	apply_gravity(delta)	
	move_and_slide()


func get_input_vector():
	var input_vector = Vector3.ZERO
	input_vector.x = Input.get_action_strength("back") -  Input.get_action_strength("forward") 
	input_vector.z = Input.get_action_strength("left") -  Input.get_action_strength("right") 
	
	return input_vector.normalized()
	
func apply_movement(input_vector):
	velocity.x = input_vector.x * speed
	velocity.z = input_vector.z * speed
	
	if input_vector != Vector3.ZERO:
		pivot.look_at(position + input_vector, Vector3.UP)

func apply_gravity(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta
