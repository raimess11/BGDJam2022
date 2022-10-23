extends Control

onready var vbox = $PauseMenu/VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PauseButton_pressed():
	$PauseMenu.visible = true
	$DarkOverlay.visible = true
	get_tree().paused = true


func _on_Resume_pressed():
	$PauseMenu.visible = false
	$DarkOverlay.visible = false
	get_tree().paused = false


func _on_Exit_pressed():
	get_tree().quit()


func _on_Main_Menu_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://ui/menu.tscn")


func _on_Restart_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
