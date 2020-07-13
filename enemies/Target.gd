extends Spatial


onready var stats = $Stats;

func onDamageRecieved():
	stats.decrementCurrentHealth(1)
	print(stats.getCurrentHealth())
	
func onNoHealth():
	queue_free()