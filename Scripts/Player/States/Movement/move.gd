class_name Move_State
extends BaseState

func physics_process(_player : Player, _delta : float):
	if (not _player.is_on_floor()):
		_player.change_states(_player.movement_states.FALL)
		return
		
	print("Moving")
	if (Input.is_action_pressed("jump")):
		_player.change_states(_player.movement_states.JUMP)
	if (Input.is_action_pressed("right")):
		_player.acceleration += Vector2.RIGHT * 98 * _delta * _player.move_speed
	elif (Input.is_action_pressed("left")):
		_player.acceleration += Vector2.LEFT * 98 * _delta * _player.move_speed
	else: 
		print("Change to IDLE")
		_player.change_states(_player.movement_states.IDLE)
		return
