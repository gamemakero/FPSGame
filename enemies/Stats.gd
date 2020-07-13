extends Node

signal noHealth

export var maxHealth: int
onready var currentHealth: int = maxHealth setget decrementCurrentHealth, getCurrentHealth

	
func decrementCurrentHealth(health: int):
	if(currentHealth <= health):
		currentHealth = 0
		emit_signal("noHealth")
		return;
	currentHealth = currentHealth - health


func getCurrentHealth():
	return currentHealth