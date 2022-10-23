extends Node2D

var start = Vector2(32,128)
var room1 = Vector2(480,128)
var room2 = Vector2(480,544)
var room3 = Vector2(480,928)
var room4 = Vector2(224,1024)
var final = Vector2(224,1216)

onready var player = $Player
onready var camera = $Camera2D
onready var star_next_sensor = $Starter/Area2D

var tabRoom = []

func _ready():
#	camera.global_position = player.global_position
	tabRoom = get_children()
#	star_next_sensor.global_position.y = player.global_position.y
#	player.global_position = start
	ganti_room(tabRoom[0])

func _physics_process(delta):
	pass
#	print(player.global_position)

func ganti_room(room):
	for child in get_children():
		child.visible = false
	room.visible = true
	player.visible = true

func _on_Enter_body_entered(body):
	if body.is_in_group("Player"):
		player.global_position = start
#		camera.global_position = player.global_position
		ganti_room(tabRoom[0])


func _on_Enter2_body_entered(body):
	if body.is_in_group("Player"):
		player.global_position = start
#		camera.global_position = player.global_position
		ganti_room(tabRoom[0])


func _on_Enter3_body_entered(body):
	if body.is_in_group("Player"):
		player.global_position = start
#		camera.global_position = player.global_position
		ganti_room(tabRoom[0])


func _on_Next_body_entered(body):
	if body.is_in_group("Player"):
		player.global_position = room1
#		camera.global_position = player.global_position
		ganti_room(tabRoom[1])


func _on_Next_body_enteredR1(body):
	if body.is_in_group("Player"):
		player.global_position = room2
#		camera.global_position = player.global_position
		ganti_room(tabRoom[2])
		print("go to room 2")


func _on_Start_body_enteredR1(body):
	if body.is_in_group("Player"):
		print("back to start")
		player.global_position = start
#		camera.global_position = player.global_position
		ganti_room(tabRoom[0])


func _on_Prev_body_enteredR1(body):
	if body.is_in_group("Player"):
		player.global_position = start
#		camera.global_position = player.global_position
		ganti_room(tabRoom[0])


func _on_Prev_body_enteredR2(body):
	if body.is_in_group("Player"):
		player.global_position = room1
#		camera.global_position = player.global_position
		ganti_room(tabRoom[1])
		print("back to room 1")


func _on_Next_body_enteredR2(body):
	if body.is_in_group("Player"):
		player.global_position = room3
#		camera.global_position = player.global_position
		ganti_room(tabRoom[3])


func _on_Start_body_enteredR2(body):
	if body.is_in_group("Player"):
		player.global_position = start
#		camera.global_position = player.global_position
		ganti_room(tabRoom[0])


func _on_Prev_body_enteredR3(body):
	if body.is_in_group("Player"):
		player.global_position = room2
#		camera.global_position = player.global_position
		ganti_room(tabRoom[2])


func _on_Next_body_enteredR3(body):
	if body.is_in_group("Player"):
		player.global_position = room4
#		camera.global_position = player.global_position
		ganti_room(tabRoom[4])


func _on_Start_body_enteredR3(body):
	if body.is_in_group("Player"):
		player.global_position = start
#		camera.global_position = player.global_position
		ganti_room(tabRoom[0])


func _on_Start_body_enteredR4(body):
	if body.is_in_group("Player"):
		player.global_position = start
#		camera.global_position = player.global_position
		ganti_room(tabRoom[0])


func _on_Start2_body_enteredR4(body):
	if body.is_in_group("Player"):
		player.global_position = start
#		camera.global_position = player.global_position
		ganti_room(tabRoom[0])


func _on_Next_body_enteredR4(body):
	if body.is_in_group("Player"):
		player.global_position = final
#		camera.global_position = player.global_position
		ganti_room(tabRoom[5])


func _on_Prev_body_enteredR4(body):
	if body.is_in_group("Player"):
		player.global_position = room3
#		camera.global_position = player.global_position
		ganti_room(tabRoom[3])

func _on_Area2D_body_enteredStart(body):
	if body.is_in_group("Player"):
		player.global_position = room1
#		camera.global_position = player.global_position
		ganti_room(tabRoom[1])


func _on_YouWin_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().change_scene("res://Level/Level1/win.tscn")
