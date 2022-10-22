extends Node2D

func _ready():
	pass

func _physics_process(delta):
	pass
	
func gotPick():
	$Area2D.set_collision_layer_bit(1,false)
	visible = false

func gotDrop(position: Vector2):
	$Area2D.set_collision_layer_bit(1,true)
	visible = true
	global_position = position

	
func pointed():
	$Pointer.visible = true
	
func notPointed():
	$Pointer.visible = false
