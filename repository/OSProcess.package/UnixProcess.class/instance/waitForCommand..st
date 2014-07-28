external command processing
waitForCommand: aCommandString
	"Run a command in a shell process. Similar to the system(3) call in the standard C library.
	The active Smalltalk process waits for completion of the external command process. This just
	uses a simple polling loop, which is not very elegant but works well enough for most purposes."

	"OSProcess thisOSProcess waitForCommand: 'echo sleeping...; sleep 3; echo I just slept for three seconds'"

	| proc d |
	d := Delay forMilliseconds: 50.
	proc := self
		forkJob: ExternalUnixOSProcess defaultShellPath
		arguments: (Array with: '-c' with: aCommandString)
		environment: nil
		descriptors: nil.
	proc ifNil: [self class noAccessorAvailable].
	[proc runState == #complete] whileFalse: [d wait].
	^ proc
