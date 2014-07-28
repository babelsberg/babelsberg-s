examples
listDirectory
	"Execute a simple command, sending output to standard output."

	"UnixProcess listDirectory"

	| proc |
	proc := self
			forkJob: '/bin/ls'
			arguments: nil
			environment: nil
			descriptors: nil.
	proc ifNil: [self noAccessorAvailable].
	^ proc