extends State

@export var patrolable := false
@export var patrol_cooldown := 0.0

var cooldown := patrol_cooldown

func _ready():
	state_name = 'idle'

func enter():
	animation_player.play('idle')
	cooldown = patrol_cooldown

func exit():
	pass

func update(delta: float):
	if patrolable:
		cooldown = max(0, cooldown - delta)

func physics_update(delta: float):
	if character.velocity.y < 0:
		transitioned.emit(self, 'jump')
		return
	
	if character.velocity.y > 0:
		transitioned.emit(self, 'fall')
		return
	
	if cooldown == 0:
		transitioned.emit(self, 'patrol')
		return
	
	character.velocity.x = move_toward(character.velocity.x, 0, 100)
