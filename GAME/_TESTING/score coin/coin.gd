extends Node3D

@onready var hud = $"../CanvasLayer/HUD"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_area_entered(area):
	pass # Replace with function body.


func _on_area_3d_body_entered(body):
	if body is Player:
		print("yay")
		hud.scoreDisplay()
		body.scoring()
		queue_free()
