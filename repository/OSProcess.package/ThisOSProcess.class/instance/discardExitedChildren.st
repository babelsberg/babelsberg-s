child process management
discardExitedChildren
	"Remove entries for completed child processed from dictionary."

	self updateAllMyChildren.
	accessProtect
		critical: [ allMyChildren := allMyChildren select: [ :p | p isComplete not ] ].
	^ allMyChildren
