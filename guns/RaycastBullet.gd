extends RayCast

var timer = 0
const KILL_TIMER = 4

func _physics_process(delta):
	timer += delta
	if timer >= KILL_TIMER:
		queue_free()
		
