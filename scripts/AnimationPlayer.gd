extends AnimationPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	List = get_parent().get_parent().get_child(2)
	Time = List.get_parent().get_child(3)
	print(List.name)
	state = 0
	pass # Replace with function body.
var state
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var now = OS.get_datetime(true)
	if(time!=null):
		if(time["second"] == now["second"] && time["minute"] == now["minute"]):
			print("yeee")
			stop()
			state = 2
	pass
var List
var Time
func _on_StaticBody_input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventScreenTouch || event is InputEventMouseButton:
		if event.is_pressed():
			if state == 0:
				List.visible=true
				print(List.name)
			if state == 1:
				print("try to stop me!")
			if state == 2:
				get_parent().remove_child(ass)
				print("erasing")
				state = 0
			print("click")
			#var printer = load("res://Spatial.tscn")
			#var ass = printer.instance()
			#ass.visible=true
			#var end = get_parent()
			#end.add_child(ass)
		else:
			print("nope") 
	pass # Replace with function body.

var time
var ass
func _on_ItemList_item_selected(index):
	print(index)
	if index == 0:
		var printer = load("res://models/Spatial.tscn")
		ass = printer.instance()
		ass.visible=true
		var end = get_parent()
		print(name)
		end.add_child(ass)
		time = OS.get_datetime(true)
		state = 1
		time["second"]+=30
		var smth = time["second"]/60
		time["second"] = time["second"]%60
		time["minute"] += smth 
		smth = time["minute"]/60
		time["minute"] = time["minute"]%60
		time["hour"] += smth 
		smth = time["hour"]/24
		time["hour"] = time["hour"]%24
		time["day"] += smth 
		print(time)
	if index == 1:
		var printer = load("res://models/Print1.tscn")
		ass = printer.instance()
		ass.visible=true
		var end = get_parent()
		print(name)
		end.add_child(ass)
		time = OS.get_datetime(true)
		state = 1
		time["second"]+=15
		var smth = time["second"]/60
		time["second"] = time["second"]%60
		time["minute"] += smth 
		smth = time["minute"]/60
		time["minute"] = time["minute"]%60
		time["hour"] += smth 
		smth = time["hour"]/24
		time["hour"] = time["hour"]%24
		time["day"] += smth 
	play("printer1")
	print(current_animation)
	List.unselect(index)
	List.visible=false
	pass # Replace with function body.
