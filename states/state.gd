class_name State
extends Node

signal transitioned

@export var character: CharacterBody2D
@export var animation_player: AnimationPlayer
@export var state_name: String

func enter():
	pass

func exit():
	pass

func update(delta: float):
	pass

func physics_update(delta: float):
	pass
