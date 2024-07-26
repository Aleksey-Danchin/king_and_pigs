extends State

@export var jump := -200
@export var speed := 100

func _ready():
	state_name = 'jump'

func enter():
	animation_player.play('jump')
	if character.is_on_floor():
		character.velocity.y = jump

func physics_update(delta: float):
	if character.velocity.y > 0:
		transitioned.emit(self, 'fall')
		return
	
	if character.is_on_floor():
		transitioned.emit(self, 'idle')
		return
	
	if Input.is_action_just_pressed('attack'):
		transitioned.emit(self, 'attack')
		return
	
	var dir = Input.get_axis("ui_left", 'ui_right')
	if dir:
		character.velocity.x = speed * dir
	else:
		character.velocity.x = move_toward(character.velocity.x, 0, 100)
