extends State

@export var speed := 100.0

func _ready():
	state_name = 'run'

func enter():
	animation_player.play('run')

func exit():
	pass

func update(delta: float):
	pass

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
	if not dir:
		transitioned.emit(self, 'idle')
		return
	
	character.velocity.x = dir * speed
