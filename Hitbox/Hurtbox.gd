extends Area


signal damageRecieved(damage)


func bulletCollisioned(baseDamage: int):
	emit_signal("damageRecieved", baseDamage)
