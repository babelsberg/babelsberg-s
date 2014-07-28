examples
spawnTenHeadlessChildren
	"Spawn ten Squeak children, each of which writes a message to standard 
	output, then exits. Answer an array of pid values for the child 
	processes. "

	"UnixProcess spawnTenHeadlessChildren"

	| childBlock count children this |
	this := OSProcess thisOSProcess.
	this stdOut ifNil: [self noAccessorAvailable. ^ nil].
	count := 10.
	children := Array new: count.
	childBlock := 
			[this stdOut nextPutAll: 'hello world from child process '.
			this pid printOn: this stdOut.
			this stdOut nextPut: Character lf.
			this stdOut flush].
	(1 to: count)
		do: 
			[:e | 
			OSProcess thisOSProcess stdOut flush.
			children at: e put: (self forkHeadlessSqueakAndDoThenQuit: childBlock)].
	^ children