extends State

func _ready():
	state_name = 'fall'

func enter():
	animation_player.play('fall')

func exit():
	pass

func update(delta: float):
	pass

func physics_update(delta: float):
	if character.velocity.y < 0:
		transitioned.emit(self, 'jump')
		return
	
	if character.is_on_floor():
		transitioned.emit(self, 'ground')
		return
