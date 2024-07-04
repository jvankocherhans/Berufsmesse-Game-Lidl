extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	print("test")
	if body.isFreezed == true:
		# Do something when the player has the variable set to true
		print("Player entered and the variable is true")
		Global.update_score()
		queue_free()

