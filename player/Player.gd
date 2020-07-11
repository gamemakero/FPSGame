extends KinematicBody

#exports to configure movement
export var moveSpeed : float = 10
export var acceleration : float = 20
export var gravity : float = 9
export var mouseSensitivity: float = 0.1
export var jumpSpeed : float = 4
#movement variables
onready var direction = Vector3.ZERO
onready var velocity = Vector3.ZERO
onready var fall = Vector3.ZERO
#child nodes needed
onready var head = $Head
onready var loadout = $Head/Loadout



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta:float) -> void:
	
	movement(delta)

func movement(delta):
	direction = Vector3()
	if  !is_on_floor():
		fall.y -= gravity * delta
	if Input.is_action_just_pressed("jump"):
		fall.y = jumpSpeed
	if Input.is_action_pressed("MoveForward"):
		direction -= transform.basis.z
	if Input.is_action_pressed("MoveBack"):
		direction += transform.basis.z
	if Input.is_action_pressed("MoveLeft"):
		direction -= transform.basis.x
	if Input.is_action_pressed("MoveRight"):
		direction += transform.basis.x
	direction = direction.normalized()
	velocity = velocity.linear_interpolate(direction * moveSpeed, acceleration * delta)
	velocity = move_and_slide(velocity, Vector3.UP)
	fall = move_and_slide(fall,Vector3.UP)

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg2rad(-event.relative.x * mouseSensitivity))
		head.rotate_x(deg2rad(-event.relative.y * mouseSensitivity))
		head.rotation.x = clamp(head.rotation.x,deg2rad(-90),deg2rad(90))
