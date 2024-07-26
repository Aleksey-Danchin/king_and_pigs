extends Node

@export var character: CharacterBody2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if not character.is_on_floor():
		character.velocity.y += gravity * delta	
	character.move_and_slide()
