extends Control

enum GAME_STATE{
	playing,
	paused
}

onready var state = GAME_STATE.playing

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_released("ui_cancel") and state == GAME_STATE.playing:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().paused = true #pauses game logic
		show() #shows pause menu
		state = GAME_STATE.paused
	elif Input.is_action_just_released("ui_cancel") and state == GAME_STATE.paused:
		onResumeButtonPressed()
#hides menu, unpauses the scene and changes state to playing
func onResumeButtonPressed():
	hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	state = GAME_STATE.playing
	get_tree().paused = false
	

func onQuitPressed():
	get_tree().quit() # quits the game
