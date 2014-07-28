child process management
activeChildren
	"Answer child processes which are currently believed to be running."

	"OSProcess thisOSProcess activeChildren"

	| children |
	accessProtect
		critical: [ children := allMyChildren select: [ :p | p isRunning ] ].
	^children
