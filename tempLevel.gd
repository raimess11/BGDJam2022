extends Node2D

var current_room

var tabRoom = []

func _ready():
	tabRoom[0] = preload("res://room.tscn")
	tabRoom[1] = preload("res://room.tscn")
	current_room = tabRoom[0]

