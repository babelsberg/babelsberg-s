setting run state
complete
	"Process has exited and has been reaped. It no longer exists in the external operating system."

	(threads notNil and: [threads size > 0]) ifTrue: [threads do: [:t | t complete]].
	self closeHandles.
	super complete
