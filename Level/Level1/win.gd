extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Start_pressed():
	get_tree().change_scene("res://Level/Level1/Level1.tscn")


func _on_Credit_pressed():
	get_tree().change_scene("res://ui/menu.tscn")


func _on_Exit_pressed():
	get_tree().quit()
