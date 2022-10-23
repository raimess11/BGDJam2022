extends Node2D


onready var map = $TileMap

var a = {1:Vector2(-192,128),2:Vector2(-704,-192),3:Vector2(-192,-512),4:Vector2(-512,-192)}
var i = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	map.position = a[i]


func _physics_process(delta):
	pass
