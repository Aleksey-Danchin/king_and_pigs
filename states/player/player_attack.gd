extends State

func _ready():
	state_name = 'attack'

func enter():
	character.velocity.x = move_toward(character.velocity.x, 0, 100.0)
	animation_player.play('hit')
	await animation_player.animation_finished
	
	if character.velocity.y > 0:
		transitioned.emit(self, 'fall')
		return
	
	if character.velocity.y < 0:
		transitioned.emit(self, 'jump')
		return
	
	transitioned.emit(self, 'idle')
