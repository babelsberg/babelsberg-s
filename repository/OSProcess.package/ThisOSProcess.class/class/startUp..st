system startup
startUp: resuming
	"Initialize my singleton instance, and the singleton instance of my
	OSProcessAccessor. On Unix, set the signal handler in my process
	accessor to respond to externally generated sigchld signals. This
	must be done after each image restart in order to call a primitive
	which informs the VM of the identity of the semaphore to signal.
	When not running on a Unix system, the primitive fails and the
	method has no effect. Notify dependents of the singleton instance
	if the image has restarted in a different OS process (this is not the
	case when #startUp is called after a simple image save). The
	notification is done in the initialization of my OSProcessAccessor."

	| aio |
	(aio := Smalltalk at: #AioEventHandler)
		ifNotNil: [ aio startUp: resuming ].
	self initializeThisOSProcess