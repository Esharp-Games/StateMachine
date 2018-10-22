extends StateBase

enum transitions {Exit}

export(String) var message

func on_start(exit_args = []):
	if message != null: print(message)
	else: print("No Message To Print...")
	invoke_transition(Exit)
