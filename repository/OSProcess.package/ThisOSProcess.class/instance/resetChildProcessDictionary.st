updating
resetChildProcessDictionary
	"Forget all the entries in the allMyChildren dictionary. This method may be called
	when a new session is started, since the child processes of the previous session are
	probably no longer of any interest."

	self updateAllMyChildren. "Ensure contents are up to date before releasing them."
	self initializeAllMyChildren
