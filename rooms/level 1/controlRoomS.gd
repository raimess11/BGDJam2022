extends Node2D

var tabAccessPoint = []
onready var theRoom1 = preload("res://rooms/level 1/starter(ac2).tscn").instance()
onready var theRoom2 = preload("res://rooms/level 1/starter(ac3).tscn").instance()
onready var theRoom3 = preload("res://rooms/level 1/starter(ac4).tscn").instance()
onready var theRoom4 = get_parent().duplicate()

var tabRoom = []

var currentRoom:bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	tabRoom = [theRoom4,theRoom1,theRoom2,theRoom3]
	print(get_parent().name)
	for child in get_parent().get_node("TileMap").get_children():
		if child.is_in_group("AccessPoint"):
			tabAccessPoint.append(child.position)
	if currentRoom:
		generate_around()

func generate_around():
	var index =0
	tabAccessPoint.shuffle()
	for point in tabAccessPoint:
		var r = tabRoom[index]
		r.name = r.name + "(" + str(index) + ")"
		r.position = point
		get_tree().current_scene.call_deferred("add_child", r)
		index+=1
