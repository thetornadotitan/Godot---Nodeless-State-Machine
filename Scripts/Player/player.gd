class_name Player
extends CharacterBody2D

var acceleration : Vector2
var move_speed  : float = 7500.0
var velocity_degradation : float = 0.80

var states : Dictionary[movement_states, BaseState]
var current_state_enum : movement_states = movement_states.FALL
var current_state : BaseState

enum movement_states {
	IDLE,
	MOVE,
	FALL,
	JUMP
}

func _enter_tree() -> void:
	states.get_or_add(movement_states.IDLE, IdleState.new())
	states.get_or_add(movement_states.MOVE, MoveState.new())
	states.get_or_add(movement_states.FALL, FallState.new())
	states.get_or_add(movement_states.JUMP, JumpState.new())
	
	current_state = states.get(current_state_enum) as BaseState

func _process(delta: float) -> void:
	current_state.process(self, delta)

func _physics_process(delta: float) -> void:
	current_state.physics_process(self, delta)
	
	velocity += acceleration
	acceleration = Vector2.ZERO
	move_and_slide()
	velocity *= velocity_degradation

func change_states(new_state : movement_states):
	current_state.exit_state(self)
	current_state_enum = new_state
	current_state = (states.get(current_state_enum) as BaseState)
	current_state.enter_state(self)
