extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var hitbox_shape = $Hitbox/HitboxShape

func _process(delta):
	if velocity.x > 0 and not animated_sprite.flip_h:
		animated_sprite.flip_h = true
		animated_sprite.position.x = 3
		hitbox_shape.position.x = 13
	elif velocity.x < 0 and animated_sprite.flip_h:
		animated_sprite.flip_h = false
		animated_sprite.position.x = -3
		hitbox_shape.position.x = -13

func _physics_process(delta):
	var dir = Input.get_axis("ui_left", 'ui_right')
	if dir:
		velocity.x = dir
