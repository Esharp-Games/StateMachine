extends StateBase

enum transitions {
	Exit
}

func on_start(exit_args = []):
	print("Transitioning to the next state with the last state's exit arguments.")
	invoke_transition(Exit, exit_args)