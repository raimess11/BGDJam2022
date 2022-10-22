extends KinematicBody2D

var velocity:Vector2
var direction:Vector2
const SPEED:int = 12000

var is_grap:bool

var item:Node2D
var tabItem = []

func _ready():
	is_grap = false
#	tabItem = get_tree().get_nodes_in_group("Item")

func _physics_process(delta):
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left") 
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	velocity = direction.normalized() * SPEED * delta
	
	velocity = move_and_slide(velocity,Vector2.UP)

func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		is_grap = !is_grap
		if is_grap:
			if tabItem.size() > 0:
				grap()
		else:
			drop()
	

func grap():
	var tempDistance:float
	for element in tabItem:
		if element.global_position.distance_to(global_position) <= tempDistance:
			tempDistance = element.global_position.distance_to(global_position)
			item = element
		print(item)
	item.graped = true


func drop():
	item.graped = false


func _on_Area2D_area_entered(area):
	var tempDistance
	for child in area:
		if child.is_in_group("Item"):
			tabItem.append(area)
		print(tabItem)


func _on_Area2D_area_exited(area):
	if area in tabItem:
		tabItem.erase(area)
