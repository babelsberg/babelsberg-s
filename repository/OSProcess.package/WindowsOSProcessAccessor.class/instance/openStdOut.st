standard IO handles
openStdOut
	"Answer an IO handle (representing a SQFile data structure in interp.c) for the standard
	output for the OS process in which I am currently executing. Open a console if necessary
	to make standard input available."

	"OSProcess accessor openStdOut"

	| output |
	output := self primGetStdOutputForSession: self sessionIdentifier.
	output ifNil: [^ nil].
	output last
		ifFalse:
			[self primAllocConsole.
			output := self primGetStdOutputForSession: self sessionIdentifier].
	^ self ioAccessorFromSQFile: output first
