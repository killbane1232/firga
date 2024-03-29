extends Camera

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var money = 15
var ite
var txt

# Called when the node enters the scene tree for the first time.
func _ready():
	txt = get_child(0).get_child(5).get_child(1)
	return

onready var cam = get_node(".")
onready var cam_coord = cam.translation

func _input(event):
	if event is InputEventScreenDrag:
		print(event.relative)
		if(cam.translation.x+event.relative.x * -0.003<= 3.65 && cam.translation.x+event.relative.x * -0.003>= -2.142):
			cam.translate(Vector3(event.relative.x * -0.003, 0, 0))
		else:
			if(cam.translation.x+event.relative.x * -0.003> 3.65):
				cam.translation.x=3.65
			else:
				cam.translation.x=-2.142
	return

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_ItemList_item_selected(index):
	return
func enouth(var mon):
	return mon<=money

func _on_moneycng(var a):
	print("were")
	money += a
	txt.text = String(money)
	return
	

func _on_Menu_pressed():
	print('Menu is open')
	
	get_node("Control/Menu").visible = false
	
	get_node("Control/ChooseRoom").visible = true
	get_node("Control/ExitGame").visible = true
	get_node("Control/ExitMenu").visible = true
	get_node("Control/Options").visible = true
	
	return


func _on_Menu_gui_input(event):
	if event is InputEventScreenTouch:
		print('Menu is open')
		
		get_node("Control/Menu").visible = false
	
		get_node("Control/ChooseRoom").visible = true
		get_node("Control/ExitGame").visible = true
		get_node("Control/ExitMenu").visible = true
		get_node("Control/Options").visible = true
	return


func _on_ExitMenu_pressed():
	print('Menu is closed')
	
	get_node("Control/Menu").visible = true
	
	get_node("Control/ChooseRoom").visible = false
	get_node("Control/ExitGame").visible = false
	get_node("Control/ExitMenu").visible = false
	get_node("Control/Options").visible = false
	return


func _on_ExitMenu_gui_input(event):
	if event is InputEventScreenTouch:
		print('Menu is closed')
		
		get_node("Control/Menu").visible = true
	
		get_node("Control/ChooseRoom").visible = false
		get_node("Control/ExitGame").visible = false
		get_node("Control/ExitMenu").visible = false
		get_node("Control/Options").visible = false
	return


func _on_ExitGame_pressed():
	print('Goodbye')
	get_tree().quit()
	return


func _on_ExitGame_gui_input(event):
	if event is InputEventScreenTouch:
		print('Goodbye')
		get_tree().quit()
	return


func _on_Options_pressed():
	print('Options is open')
	return


func _on_Options_gui_input(event):
	if event is InputEventScreenTouch:
		print('Options is open')
	return


func _on_ChooseRoom_pressed():
	print('Choosing room')
	return


func _on_ChooseRoom_gui_input(event):
	if event is InputEventScreenTouch:
		print('Choosing room')
	return
