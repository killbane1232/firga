extends MeshInstance


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("FUCK")
	print(name)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_StaticBody_input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventScreenTouch || event is InputEventMouseButton:
		if event.is_pressed():
			
			print("click")
			var printer = load("res://Print1.tscn")
			var ass = printer.instance()
			ass.visible=true
			var end = get_parent()
			end.add_child(ass)
		else:
			print("nope") 
	pass # Replace with function body.
