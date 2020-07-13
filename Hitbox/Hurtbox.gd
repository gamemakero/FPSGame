extends Area

signal damageRecieved
func bulletCollisioned():
    emit_signal("damageRecieved")