extends Spatial

var damage = 0
var timer = 0
export var bulletSpeed = 0.1
const KILL_TIMER = 4
var forward_dir


func _physics_process(delta):
	forward_dir = global_transform.basis.x
	global_translate(forward_dir * bulletSpeed * delta)
	timer += delta
	if timer >= KILL_TIMER:
		queue_free()
		

func setDamage(value: int):
	damage = value


func areaEntered(area):
	print("Bullet collided with: " + area.name)
	queue_free()
	return