extends Spatial


var mainGun : Spatial
var secondaryGun : Spatial
var granade : Spatial
onready var currentGun : Spatial


func equipGun(node: Resource):
	var clone = node.instance()
	add_child(clone)
	mainGun = clone
	currentGun = clone
	clone.show()
	clone.global_transform.scaled(Vector3(0.05, 0.05, 0.05))
	print(clone.global_transform)
	
