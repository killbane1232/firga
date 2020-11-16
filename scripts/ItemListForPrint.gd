extends ItemList


# Declare member variables here. Examples:

var a = 2
# var b = "text"
func se():
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	add_item("Erase",load("res://Images/cross.tres"))
	add_item("Cube",load("res://Images/cube.tres"))
	add_item("Girl",load("res://Images/girl.tres"))
	return


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
