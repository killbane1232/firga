extends AnimationPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var state
var mode
var end
var List
var time
var ass
var audio
var cont
var cam
var prc
var slider
var box

var sldr=-0.505
var height

signal moneycng
# Called when the node enters the scene tree for the first time.
func _ready():
	cont = get_parent().get_parent().get_child(2)
	List = cont.get_child(0)
	print(List.name)
	slider = get_parent().get_child(2)
	audio = get_parent().get_parent().get_child(3)
	state = 0
	cam = get_node("/root/Spatial/Camera")
	connect("moneycng",cam,"_on_moneycng")
	print(cam.name)
	end = get_parent().get_child(1).get_child(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var now = OS.get_datetime(true)
	if(state == 1):
		if(time["second"] <= now["second"] && time["minute"] <= now["minute"] && time["hour"] <= now["hour"]):
			print("yeee")
			play("printer1clr")
			state = 2
			audio.play()
			prc = 1
		else:
			var dlt = float((((time["day"]-now["day"])*24+time["hour"]-now["hour"])*60+time["minute"]-now["minute"])*60+time["second"]-now["second"])
			print(float(dlt)/(15.0*(2.0-float(mode))))
			prc = float((1.0-float(dlt)/(15.0*(2.0-float(mode))))*float(height))
			print(prc)
			box.translation.y = 1+prc
			slider.translation.y = sldr+prc
			

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
				print(emit_signal("moneycng", 15*(2-mode)))
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


func _on_ItemList_item_selected(index):
	print(index)
	var printer
	if index == 0:
		printer = load("res://models/CSG/GirlCSG.tscn")
		ass = printer.instance()
		ass.visible=true
		print(name)
		end.add_child(ass)
		box = ass.get_child(0)
		time = OS.get_datetime(true)
		state = 1
		prc = 0
		height = 1.5
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
		printer = load("res://models/CSG/BoxCSG.tscn")
		ass = printer.instance()
		ass.visible=true
		print(name)
		end.add_child(ass)
		box = ass.get_child(0)
		time = OS.get_datetime(true)
		state = 1
		prc = 0
		height = 0.62
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
	if index == 2:
		print(emit_signal("moneycng", 10))
		get_parent().get_parent().get_parent().queue_free()
	mode = index
	play("printer1")
	print(current_animation)
	List.unselect(index)
	#List.visible=false
	cont.visible=false


func _on_Control_gui_input(event):
	if event is InputEventScreenTouch || event is InputEventMouseButton:
		if event.is_pressed():
			#List.visible=false
			cont.visible=false

