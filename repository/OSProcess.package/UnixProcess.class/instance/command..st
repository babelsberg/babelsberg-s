external command processing
command: aCommandString
	"Run a command in a shell process. Similar to the system(3) call in the standard C library,
	except that aCommandString runs asynchronously in a child process. The command is
	run by a ConnectedUnixProcess in order to facilitate command pipelines within Squeak."

	"UnixProcess thisOSProcess command: 'ls -l /etc'"

	| proc |
	pid isNil
		ifTrue:
			[self class noAccessorAvailable. ^nil]
		ifFalse:
			[proc := self
					forkJob: ExternalUnixOSProcess defaultShellPath
					arguments: (Array with: '-c' with: aCommandString)
					environment: nil
					descriptors: nil.
			proc ifNil: [self class noAccessorAvailable].
			^ proc]
