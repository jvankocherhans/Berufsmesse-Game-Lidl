extends Node3D

var scene = "res://_tmp/ShowOff.tscn"

@onready var player_female = $Characters/PlayerFemale

@onready var player_male = $Characters/PlayerMale


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("x"):
		Global.set_character("res://Player/Female/PlayerFemale.tscn")
		SceneSwitcher.switch_scene(scene)
		
	if Input.is_action_just_pressed("b"):
		Global.set_character("res://Player/Male/PlayerMale.tscn")
		SceneSwitcher.switch_scene(scene)
		
