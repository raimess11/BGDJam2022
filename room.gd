extends Node2D

var tabAccessPoint = []
onready var prevRoom = preload("res://temproom.tscn") 
onready var nextRoom = preload("res://temproom.tscn")
onready var startRoom = preload("res://temproom.tscn")

var tabRoom = [prevRoom,nextRoom,startRoom]

var currentRoom:bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		tabAccessPoint.append(child.position)
	if currentRoom:
		generate_around()

func generate_around():
	var index =0 
	for point in tabAccessPoint.shuffle():
		tabRoom[index].currentRoom = false
		tabRoom[index].global_position = point
		get_tree().current_scene.add_child(tabRoom[index])
		index+=1
