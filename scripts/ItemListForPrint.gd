extends ItemList


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	add_item("Girl",load("res://buttonimg/girl.tres"))
	add_item("Cube",load("res://buttonimg/cube.tres"))
	add_item("Erase",load("res://buttonimg/cross.tres"))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
