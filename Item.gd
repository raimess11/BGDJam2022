extends Node2D

var graped:bool

func _ready():
	pass

func _physics_process(delta):
	if graped:
		graped()

func graped():
	print(001100)
