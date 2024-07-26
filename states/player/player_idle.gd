extends State
class_name PlayerIdleState

func _ready():
	state_name = 'idle'

func enter():
	animation_player.play('idle')

func physics_update(delta: float):
	if character.velocity.y > 0:
		transitioned.emit(self, 'fall')
		return
	
	if character.velocity.y < 0:
		transitioned.emit(self, 'jump')
		return
	
	if Input.is_action_just_pressed("ui_up"):
		transitioned.emit(self, 'jump')
		return
	
	if Input.is_action_just_pressed('attack'):
		transitioned.emit(self, 'attack')
		return
	
	var dir = Input.get_axis("ui_left", 'ui_right')
	if dir:
		transitioned.emit(self, 'run')
		return
	
	character.velocity.x = move_toward(character.velocity.x, 0, 100)
