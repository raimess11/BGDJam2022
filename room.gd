extends Node2D

var tabAccessPoint = []
onready var theRoom = []

var tabRoom = []

var currentRoom:bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	tabRoom = [theRoom,theRoom,theRoom,theRoom]
	print(get_parent().get_node("TileMap").get_children())
	for child in get_parent().get_node("TileMap").get_children():
		print("w")
		if child.is_in_group("AccessPoint"):
			tabAccessPoint.append(child.position)
	if currentRoom:
		generate_around()

func generate_around():
	var index =0
	tabAccessPoint.shuffle()
	
	for point in tabAccessPoint:
		var r = tabRoom[index]
		r.name = r.name + str(index)
		r.currentRoom = false
		r.global_position = point
		get_tree().current_scene.add_child(r.instance())
		index+=1
