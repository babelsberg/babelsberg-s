child process management
exitedChildren
	"Answer child processes which have exited and are no longer running."

	"OSProcess thisOSProcess exitedChildren"

	| children |
	accessProtect
		critical: [ children := allMyChildren select: [ :p | p isComplete ]].
	^ children
