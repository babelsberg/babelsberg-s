examples
headlessChild
	"Start a new instance of Squeak running in a child OS process. The new
	instance is a nearly identical copy of its parent, resuming execution at the
	same point as the parent, and differentiated only by the return value of
	this method. The child squeak will write a message to standard output,
	then exit."

	"UnixProcess headlessChild"

	| this childBlock |
	this := OSProcess thisOSProcess.
	childBlock :=
		[this stdOut nextPutAll: 'hello world from child process '.
		this pid printOn: OSProcess thisOSProcess stdOut.
		this stdOut nextPut: Character lf ].
	^ self forkHeadlessSqueakAndDoThenQuit: childBlock

