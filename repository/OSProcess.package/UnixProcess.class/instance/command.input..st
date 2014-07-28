external command processing
command: aCommandString input: aStreamOrString
	"Run a command in a shell process. Similar to the system(3) call in the standard C library,
	except that aCommandString runs asynchronously in a child process."

	"OSProcess thisOSProcess
		command: 'cat'
		input: 'this is some test data'"

	"OSProcess thisOSProcess
		command: 'cat'
		input: (ReadStream on: 'this is some test data')"

	| proc |
	(Smalltalk hasClassNamed: #PipeableOSProcess)
		ifTrue:
			[proc := (Smalltalk at: #PipeableOSProcess) command: aCommandString.
			proc ifNil: [^ nil].
			proc nextPutAll: aStreamOrString contents.
			proc pipeToInput close.
			^ proc]
		ifFalse:
			[self notify: 'the #command:input: method requires CommandShell, using #command: instead'.
			^ self command: aStreamOrString contents]

