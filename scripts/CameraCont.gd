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

func _on_ItemList_item_selected(index):
	pass # Replace with function body.


func _on_Menu_pressed():
	print('Menu is open')
	
	get_node("Control/Menu").visible = false
	
	get_node("Control/ChooseRoom").visible = true
	get_node("Control/ExitGame").visible = true
	get_node("Control/ExitMenu").visible = true
	get_node("Control/Options").visible = true
	
	pass # Replace with function body.


func _on_Menu_gui_input(event):
	if event is InputEventScreenTouch:
		print('Menu is open')
		
		get_node("Control/Menu").visible = false
	
		get_node("Control/ChooseRoom").visible = true
		get_node("Control/ExitGame").visible = true
		get_node("Control/ExitMenu").visible = true
		get_node("Control/Options").visible = true
	pass # Replace with function body.


func _on_ExitMenu_pressed():
	print('Menu is closed')
	
	get_node("Control/Menu").visible = true
	
	get_node("Control/ChooseRoom").visible = false
	get_node("Control/ExitGame").visible = false
	get_node("Control/ExitMenu").visible = false
	get_node("Control/Options").visible = false
	pass # Replace with function body.


func _on_ExitMenu_gui_input(event):
	if event is InputEventScreenTouch:
		print('Menu is closed')
		
		get_node("Control/Menu").visible = true
	
		get_node("Control/ChooseRoom").visible = false
		get_node("Control/ExitGame").visible = false
		get_node("Control/ExitMenu").visible = false
		get_node("Control/Options").visible = false
	pass # Replace with function body.


func _on_ExitGame_pressed():
	print('Goodbye')
	get_tree().quit()
	pass # Replace with function body.


func _on_ExitGame_gui_input(event):
	if event is InputEventScreenTouch:
		print('Goodbye')
		get_tree().quit()
	pass # Replace with function body.


func _on_Options_pressed():
	print('Options is open')
	pass # Replace with function body.


func _on_Options_gui_input(event):
	if event is InputEventScreenTouch:
		print('Options is open')
	pass # Replace with function body.


func _on_ChooseRoom_pressed():
	print('Choosing room')
	pass # Replace with function body.


func _on_ChooseRoom_gui_input(event):
	if event is InputEventScreenTouch:
		print('Choosing room')
	pass # Replace with function body.
