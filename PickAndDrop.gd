extends Node


static func pickUp(item: Object) -> Object:
	print(item)
	item.gotPick()
	return item
	pass
	
static func drop(item: Object, position: Vector2) -> Object:
	var newItem = item
	newItem.global_position = position
	newItem.gotDrop(position)
	return null
