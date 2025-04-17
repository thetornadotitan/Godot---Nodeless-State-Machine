class_name Jump_State
extends BaseState

var jump_time : float = 0.33
var current_jump_time : float = 0

func enter_state(_player : Player):
	current_jump_time = 0

func physics_process(_player : Player, _delta : float):
	if (current_jump_time <= jump_time and not _player.is_on_ceiling()):
		_player.acceleration += Vector2.UP * 98 * _delta * _player.move_speed
		if (Input.is_action_pressed("right")):
			_player.acceleration += Vector2.RIGHT * 98 * _delta * _player.move_speed
		elif (Input.is_action_pressed("left")):
			_player.acceleration += Vector2.LEFT * 98 * _delta * _player.move_speed
		current_jump_time += _delta
		
		if (not Input.is_action_pressed("jump")):
			_player.change_states(_player.movement_states.FALL)
	else:
		_player.change_states(_player.movement_states.FALL)
