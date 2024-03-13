extends Control

const ID_PREFIX: String = "LDL-"

@onready var InputPlayerID: LineEdit = $Registration/InputPlayerID

func _ready():
	InputPlayerID.grab_focus()

func _on_line_edit_text_submitted(input):
	# checks if the prefix equals LDL-
	if  input.begins_with(ID_PREFIX):
		print(input.lstrip(ID_PREFIX))
		visible = false
	else:
		print("wrong identification")
		InputPlayerID.text = "";
