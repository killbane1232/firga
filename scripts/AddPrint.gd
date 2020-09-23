extends MeshInstance


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var ite
var cont
var cam
# Called when the node enters the scene tree for the first time.
func _ready():
	print("FUCK")
	print(name)
	cont = get_child(1)
	ite = cont.get_child(0)	
	cam = get_node("/root/Spatial/Camera")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_StaticBody_input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventScreenTouch || event is InputEventMouseButton:
		if event.is_pressed():
			#ite.visible=true
			cont.visible=true
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


func _on_ItemList_item_selected(index):
	print(index)
	if index == 2:
		if cam.call("enouth",15):
			var printer = load("res://models/Spatial.tscn")
			var ass = printer.instance()
			ass.visible=true
			var end = get_parent()
			print(name)
			end.add_child(ass)
		else:
			print("fuck you")
	if index == 1:
		if cam.call("enouth",30):
			cam.call("_on_moneycng",-30)
			var printer = load("res://models/Printer2.tscn")
			var ass = printer.instance()
			ass.visible=true
			var end = get_parent()
			print(name)
			end.add_child(ass)
		else:
			print("fuck you")
	if index == 0:
		if cam.call("enouth",15):
			cam.call("_on_moneycng",-15)
			var printer = load("res://models/Printer1anim.tscn")
			var ass = printer.instance()
			ass.visible=true
			var end = get_parent()
			print(name)
			end.add_child(ass)
		else:
			print("fuck you")
	ite.unselect(index)
	#ite.visible=false
	cont.visible=false
	pass # Replace with function body.


func _on_Control_gui_input(event):
	if event is InputEventScreenTouch || event is InputEventMouseButton:
		if event.is_pressed():
			#ite.visible=false
			cont.visible=false
			
	pass # Replace with function body.
