extends Node

enum GAME_STATE{
	playing,
	paused
}

onready var level = $Level
onready var menu = $Menu
onready var state = GAME_STATE.playing

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_pressed("ui_cancel") and state == GAME_STATE.playing):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().paused = true #pauses game logic
		menu.show() #shows pause menu
		state = GAME_STATE.paused

#hides menu, unpauses the scene and changes state to playing
func onResumeButtonPressed():
	menu.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	state = GAME_STATE.playing
	get_tree().paused = false
	

func onQuitPressed():
	get_tree().quit() # quits the game
