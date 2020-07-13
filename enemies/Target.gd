extends Spatial


onready var stats = $Stats;

func onDamageRecieved(dmg):
	stats.decrementCurrentHealth(dmg)
	print(stats.getCurrentHealth())
	
func onNoHealth():
	queue_free()
