extends Node3D

var scene = "res://MajorScenes/1-MainMenu/MainMenu.tscn"

func _ready():
	# set first scene
	SceneSwitcher.switch_scene(scene)
 
