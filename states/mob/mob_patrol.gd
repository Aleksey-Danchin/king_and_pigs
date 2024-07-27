extends State

@export var is_rotate_in_end := true
@export var is_idle_in_end := false
@export var speed := 20.0

@export var left_ray: RayCast2D
@export var left_down_ray: RayCast2D
@export var right_ray: RayCast2D
@export var right_down_ray: RayCast2D

var dir := 1

func _ready():
	state_name = 'patrol'

func enter():
	animation_player.play('run')

func exit():
	pass

func update(delta: float):
	pass

func physics_update(delta: float):
	if character.velocity.y < 0:
		transitioned.emit(self, 'jump')
		return
	
	if character.velocity.y > 0:
		transitioned.emit(self, 'fall')
		return

	var changed := false
	if dir == 1:
		if right_ray.is_colliding() or not right_down_ray.is_colliding():
			dir = -1
			changed = true
	else:
		if left_ray.is_colliding() or not left_down_ray.is_colliding():
			dir = 1
			changed = true
	
	if changed and is_idle_in_end:
		if is_rotate_in_end:
			character.velocity.x = dir
		transitioned.emit(self, 'idle')
		return

	character.velocity.x = dir * speed
