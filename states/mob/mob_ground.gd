extends State

func _ready():
	state_name = 'ground'

func enter():
	animation_player.play('ground')
	await animation_player.animation_finished
	
	if character.velocity.y < 0:
		transitioned.emit(self, 'jump')
		return
	
	if character.velocity.y > 0:
		transitioned.emit(self, 'fall')
		return
	
	transitioned.emit(self, 'idle')
