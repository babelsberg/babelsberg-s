standard IO handles
openStdIn
	"Answer an IO handle (representing a SQFile data structure in interp.c) for the standard
	input for the OS process in which I am currently executing. Open a console if necessary
	to make standard input available."

	"OSProcess accessor openStdIn"

	| input |
	input := self primGetStdInputForSession: self sessionIdentifier.
	input ifNil: [^ nil].
	input last
		ifFalse:
			[self primAllocConsole.
			input := self primGetStdOutputForSession: self sessionIdentifier].
	^ self ioAccessorFromSQFile: input first
