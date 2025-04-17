class_name BaseState

func enter_state(_player : Player):
	pass

func exit_state(_player : Player):
	pass
	
func process(_player : Player, _delta : float):
	pass
	
func physics_process(_player : Player, _delta : float):
	print("Base State Physics Process")
