extends Camera


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var ite
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	translate(Vector3(-7.978,0,0))
	pass # Replace with function body.


func _on_Button2_pressed():
	translate(Vector3(7.978,0,0))
	pass # Replace with function body.


func _on_Button2_gui_input(event):
	if event is InputEventScreenTouch:
		translate(Vector3(7.978,0,0))
	pass # Replace with function body.


func _on_Button_gui_input(event):
	if event is InputEventScreenTouch:
		translate(Vector3(-7.5,0,0))
	pass # Replace with function body.
