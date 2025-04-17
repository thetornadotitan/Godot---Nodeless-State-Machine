class_name Idle_State
extends BaseState

func physics_process(_player : Player, _delta : float):
	if (not _player.is_on_floor()):
		_player.change_states(_player.movement_states.FALL)
		return
	
	print("IDLING")
	if (Input.is_action_pressed("right") or Input.is_action_pressed("left")):
		print("Change to move")
		_player.change_states(_player.movement_states.MOVE)
	if (Input.is_action_pressed("jump")):
		_player.change_states(_player.movement_states.JUMP)
