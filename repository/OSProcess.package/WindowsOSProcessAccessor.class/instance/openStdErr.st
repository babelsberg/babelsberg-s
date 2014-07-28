standard IO handles
openStdErr
	"Answer an IO handle (representing a SQFile data structure in interp.c) for the standard
	error for the OS process in which I am currently executing. Open a console if necessary
	to make standard error available."

	"OSProcess accessor openStdErr"

	| error |
	error := self primGetStdErrorForSession: self sessionIdentifier.
	error ifNil: [^ nil].
	error last
		ifFalse:
			[self primAllocConsole.
			error := self primGetStdOutputForSession: self sessionIdentifier].
	^ self ioAccessorFromSQFile: error first
