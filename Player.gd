extends KinematicBody2D

var velocity:Vector2
var direction:Vector2
const SPEED:int = 12000

var item:Object = null setget set_item
var inventory:Object = null
var pointed:Object = null
var detecdedItem = []
var positionDrop: Vector2 = Vector2.ZERO


onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

onready var PnD = preload("res://PickAndDrop.gd")
onready var pos = $Position

func _ready():
	animationTree.active = true
	positionDrop = pos.global_position
#	tabItem = get_tree().get_nodes_in_group("Item")
	

func set_item(value):
	if inventory != null:
		return
	if value == null && item != null:
		item.notPointed()
	elif item == null && value != null:
		value.pointed()
	elif item != null && value != null:
		item.notPointed()
		value.pointed()
	item = value
	

func _physics_process(delta):
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left") 
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	animationTree.set("parameters/BlendSpace2D/blend_position", direction)
	animationState.travel("BlendSpace2D")
	velocity = direction.normalized() * SPEED * delta
	
	velocity = move_and_slide(velocity,Vector2.UP)
	#jika player tidak bergerak
	if velocity != Vector2.ZERO:
		pos.position = direction.normalized() * 48
		positionDrop = pos.global_position

func _input(event):
	var i;
	if Input.is_action_just_pressed("ui_accept"):
		if !detecdedItem.empty() and inventory == null:
			inventory = PnD.pickUp(self.item)
		elif inventory != null:
			inventory = PnD.drop(inventory, positionDrop)
#	if !detecdedItem.empty():
#		if Input.is_action_just_pressed("ui_scroll_up"):
#			i = detecdedItem.find(item)
#			if i >= detecdedItem.size() - 1:
#				i = 0
#			else:
#				i += 1
#			self.item = detecdedItem[i]
#			print(item)
#		elif Input.is_action_just_pressed("ui_scroll_down"):
#			i = detecdedItem.find(item)
#			if i <= 0:
#				i = detecdedItem.size() - 1
#			else:
#				i -= 1
#			self.item = detecdedItem[i]
#			print(item)
	if !detecdedItem.empty() and Input.is_action_just_pressed("ui_scroll"):
		i = detecdedItem.find(item)
		if i >= detecdedItem.size() - 1:
			i = 0
		else:
			i += 1
		self.item = detecdedItem[i]
	
#pickdrop
#func grap():
#	var tempDistance:float
#	for element in tabItem:
##		if element.global_position.distance_to(global_position) <= tempDistance:
	#		tempDistance = element.global_position.distance_to(global_position)
	#		item = element
	#	print(item)
#	item.graped = true


#func drop():
#	item.graped = false


func _on_Area2D_area_entered(area):
	var par = area.get_parent()
	if par.is_in_group("Item"):
		if detecdedItem.empty() and inventory == null:
			self.item = par
		detecdedItem.append(par)
		print(detecdedItem)


func _on_Area2D_area_exited(area):
	if area.get_parent().is_in_group("Item"):
		if detecdedItem.size() > 1:
			self.item = detecdedItem[0]
		else:
			self.item = null
		detecdedItem.erase(area.get_parent())
		print(detecdedItem)
		
