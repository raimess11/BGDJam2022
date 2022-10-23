extends Control

onready var vBox = $CanvasLayer/VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	vBox.add_constant_override("separation",50)
	var start = create_tween()
	start.tween_property($CanvasLayer/Fade,"self_modulate",Color(1,1,1,0),0.5)
	start.call_deferred("start")
	yield(start, "finished")
	$CanvasLayer/Fade.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Start_pressed():
	$CanvasLayer/Fade.visible = true
	var fade = create_tween()
	fade.tween_property($CanvasLayer/Fade,"self_modulate",Color(1,1,1,1),1)
	fade.call_deferred("start")
	yield(fade, "finished")
	yield(get_tree().create_timer(1.0),"timeout")
	get_tree().change_scene("res://Level/Level1/Level1.tscn")


func _on_Credit_pressed():
	pass # Replace with function body.


func _on_Exit_pressed():
	get_tree().quit()
