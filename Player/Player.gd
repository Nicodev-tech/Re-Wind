extends KinematicBody2D

var MAX_SPEED = 500
var ACCELERATION = 2000
var motion = Vector2.ZERO

func _physics_process(delta):
	var input = get_input()
	if input == Vector2.ZERO:
		apply_fricction(ACCELERATION * delta)
	else:
		apply_movement(input * ACCELERATION * delta)
	motion = move_and_slide(motion)

func get_input():
	var input = Vector2(
		-Input.get_action_strength("left") +Input.get_action_strength("right"),
		-Input.get_action_strength("up") + Input.get_action_strength("down")
	)
	return input

func apply_fricction(value):
	if motion.length() > value:
		motion -= motion.normalized() * value
	else:
		motion = Vector2.ZERO

func apply_movement(value):
	motion += value
	motion = motion.clamped(MAX_SPEED)

