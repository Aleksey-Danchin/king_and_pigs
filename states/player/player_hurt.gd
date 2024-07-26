extends State

func _ready():
	state_name = 'hurt'

func enter():
	character.velocity.x = move_toward(character.velocity.x, 0, 100)
	animation_player.play('hurt')
	await animation_player.animation_finished
	
	if character.velocity.y > 0:
		transitioned.emit(self, 'fall')
		return
	
	if character.velocity.y < 0:
		transitioned.emit(self, 'jump')
		return
	
	transitioned.emit(self, 'idle')
