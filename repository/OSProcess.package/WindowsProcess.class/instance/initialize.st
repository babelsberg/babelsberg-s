initialize - release
initialize
	"Set my instance variables to reflect the state of the OS process in which 
	this Smalltalk virtual machine is executing. On Windows, we cannot rely
	on the pid to have changed when the VM is restarted, so use a one-shot
	function to determine if we are restarting the VM (as opposed to returning
	from an image save)."

	super initialize.
	(self processAccessor canAccessSystem not or: [processAccessor primOneShot]) ifTrue:
		["Restarting the VM in a new process"
		self resetThreads.
		self threads; mainThread.
		processHandle := nil.
		self processHandle].
	self refreshFromProcessAccessor
