extends Node3D

@onready var label = $Control/Label
@onready var label_2 = $Control/Label2


# Called when the node enters the scene tree for the first time.
func _ready():
	var play_ins = load(Global.character)
	var instance = play_ins.instantiate()
	add_child(instance)
	instance.position = $PlayerPosition.position

var last_score = 0;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if last_score != Global.score:
		label.text = "Score: " + str(Global.score)
		last_score = Global.score
		
	if last_score == 10:
		SceneSwitcher.switch_scene("res://MajorScenes/1-MainMenu/MainMenu.tscn")


func _on_timer_timeout():
	label_2.visible = false
