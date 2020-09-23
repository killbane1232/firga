extends AnimationPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var state
var mode
var end
var time
var ass
var audio
var List
var cont
var cam
signal moneycng

# Called when the node enters the scene tree for the first time.
func _ready():
	cont = get_parent().get_parent().get_child(2)
	List = cont.get_child(0)
	print(List.name)
	end = get_parent().get_child(2)
	audio = get_parent().get_parent().get_child(3)
	state = 0
	cam = get_node("/root/Spatial/Camera")
	connect("moneycng",cam,"_on_moneycng")
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var now = OS.get_datetime(true)
	if(state==1):
		if(time["second"] == now["second"] && time["minute"] == now["minute"]):
			print("yeee")
			play("printer2clr")
			state = 2
			audio.play()
			var printer
			if mode==0:
				printer = load("res://models/Spatial.tscn")
			if mode==1:
				printer = load("res://models/Print1.tscn")
			ass = printer.instance()
			ass.visible=true
			print(name)
			end.add_child(ass)
	pass
func _on_StaticBody_input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventScreenTouch || event is InputEventMouseButton:
		if event.is_pressed():
			if state == 0:
				cont.visible=true
				#List.visible=true
				print(List.name)
			if state == 1:
				print("try to stop me!")
			if state == 2:
				print("were1")
				print(emit_signal("moneycng", 20*(2-mode)))
				end.remove_child(ass)
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

func _on_ItemList_item_selected(index):
	print(index)
	if index == 0:
		time = OS.get_datetime(true)
		state = 1
		time["second"]+=20
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
		time = OS.get_datetime(true)
		state = 1
		time["second"]+=10
		var smth = time["second"]/60
		time["second"] = time["second"]%60
		time["minute"] += smth 
		smth = time["minute"]/60
		time["minute"] = time["minute"]%60
		time["hour"] += smth 
		smth = time["hour"]/24
		time["hour"] = time["hour"]%24
		time["day"] += smth 
	if index == 2:
		print(emit_signal("moneycng", 10))
		get_parent().get_parent().get_parent().queue_free()
	play("printer2")
	mode = index
	print(current_animation)
	List.unselect(index)
	#List.visible=false
	cont.visible=false
	pass # Replace with function body.

func _on_Control_gui_input(event):
	if event is InputEventScreenTouch || event is InputEventMouseButton:
		if event.is_pressed():
			#List.visible=false
			cont.visible=false
	pass # Replace with function body.
