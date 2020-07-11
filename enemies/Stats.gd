extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var maxHealth: int = 10
var currentHealth: int = 10 setget decrementCurrentHealth, getCurrentHealth
signal noHealth

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

	
func decrementCurrentHealth(health:int):
	if(currentHealth < health):
		currentHealth = 0
		emit_signal("noHealth")
		return;
	currentHealth -= health


func getCurrentHealth():
	return currentHealth