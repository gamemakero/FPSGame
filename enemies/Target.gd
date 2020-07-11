extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var stats = $Stats;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func hurtboxEntered(area):
	stats.decrementCurrentHealth(1)

	
func noHeatlh():
	queue_free()