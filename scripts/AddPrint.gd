extends MeshInstance


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var ite

# Called when the node enters the scene tree for the first time.
func _ready():
	print("FUCK")
	print(name)
	ite = get_child(1)
			
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_StaticBody_input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventScreenTouch || event is InputEventMouseButton:
		if event.is_pressed():
			ite.visible=true
			print(ite.name)
			print("click")
			#var printer = load("res://Spatial.tscn")
			#var ass = printer.instance()
			#ass.visible=true
			#var end = get_parent()
			#end.add_child(ass)
		else:
			print("nope") 
	pass # Replace with function body.


func _on_ItemList2_item_selected(index):
	print(index)
	if index == 0:
		var printer = load("res://models/Spatial.tscn")
		var ass = printer.instance()
		ass.visible=true
		var end = get_parent()
		print(name)
		end.add_child(ass)
	if index == 1:
		var printer = load("res://models/Print1.tscn")
		var ass = printer.instance()
		ass.visible=true
		var end = get_parent()
		print(name)
		end.add_child(ass)
	if index == 2:
		var printer = load("res://models/Printer1anim.tscn")
		var ass = printer.instance()
		ass.visible=true
		var end = get_parent()
		print(name)
		end.add_child(ass)
	ite.unselect(index)
	ite.visible=false
	pass # Replace with function body.
