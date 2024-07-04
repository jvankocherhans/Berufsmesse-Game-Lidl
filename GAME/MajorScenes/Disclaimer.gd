extends Control

var timer_fini = false

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for action in InputMap.get_actions():
		if Input.is_action_just_pressed(action) && timer_fini:
			SceneSwitcher.switch_scene("res://MajorScenes/2-CharacterSelectionAndCustomization/CharacterSelection.tscn")


func _on_timer_timeout():
	timer_fini = true
