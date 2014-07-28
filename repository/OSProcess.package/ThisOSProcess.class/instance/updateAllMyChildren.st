child process management
updateAllMyChildren
	"Test each child to make sure that it is still accessible. If the child is believed to be
	running, check to see if it has exited, and update runState and exitStatus accordingly."

	| children |
	accessProtect critical: [children := allMyChildren asArray].
	children do:
		[:child |
		child update: #accessibility.
		child isRunning ifTrue: [child update: #runState]]
