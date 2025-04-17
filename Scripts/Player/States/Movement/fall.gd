class_name FallState
extends BaseState

func physics_process(_player : Player, _delta : float):
	if (not _player.is_on_floor()):
		_player.acceleration = Vector2.DOWN * _delta * _player.move_speed
		
		if (Input.is_action_pressed("right")):
			_player.acceleration += Vector2.RIGHT * _delta * _player.move_speed
		elif (Input.is_action_pressed("left")):
			_player.acceleration += Vector2.LEFT * _delta * _player.move_speed
	else:
		_player.change_states(_player.movement_states.IDLE)
