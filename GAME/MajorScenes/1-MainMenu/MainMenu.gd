extends Control


var timi = false

func _process(delta):
	for action in InputMap.get_actions():
		if Input.is_action_just_pressed(action) && timi:
			SceneSwitcher.switch_scene("res://MajorScenes/Disclaimer.tscn")

func _on_singleplayer_pressed():
	# forwarding to character selection scene
	SceneSwitcher.switch_scene("res://MajorScenes/Disclaimer.tscn")
	


func _on_timer_timeout():
	timi = true
