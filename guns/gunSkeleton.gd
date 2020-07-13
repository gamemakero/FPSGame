extends Spatial


enum WEAPON_STATE{
	shooting,
	reloading,
	idle,
}

onready var raycast = preload("RaycastBullet.tscn")
onready var bulletHole = $BulletHole 
onready var fireRate = $FireRate
onready var reload = $Reload
onready var state = WEAPON_STATE.idle

export var baseDamage: int
export var magazineSize: int

onready var currentBulletCount: int = magazineSize


func shoot():
	if state == WEAPON_STATE.idle:
		shootRay()
		currentBulletCount -= 1
		print(currentBulletCount)
		if currentBulletCount == 0:
			reload()
		else:
			fireRate.start()


func fireRateTimeOut():
	state = WEAPON_STATE.idle
	fireRate.stop()


func onReloadTimeout():
	state = WEAPON_STATE.idle
	currentBulletCount = magazineSize
	reload.stop()

func reload():
	reload.start()
	state = WEAPON_STATE.reloading

#shoots raycast to detect collision
func shootRay():
	state = WEAPON_STATE.shooting
	var ray = raycast.instance()
	var scene_root = get_tree().root.get_children()[0]
	scene_root.add_child(ray)
	ray.global_transform = bulletHole.global_transform
	ray.force_raycast_update()
	if ray.is_colliding():
		print("Ray is colliding")
		var body = ray.get_collider()
		if body.has_method("bulletCollisioned"):
			body.bulletCollisioned()
			ray.queue_free()
		else:
			#ray.queue_free()
			print("collided with object")
