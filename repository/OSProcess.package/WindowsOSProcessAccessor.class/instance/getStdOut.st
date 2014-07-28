standard IO handles
getStdOut
	"Answer an IO handle (representing a SQFile data structure in interp.c) for the standard
	output for the OS process in which I am currently executing, or nil if the IO handle
	cannot be obtained."

	"OSProcess accessor getStdOut"

	| output |
	output := self primGetStdOutputForSession: self sessionIdentifier.
	^ (output notNil and: [output last])
		ifTrue: [self ioAccessorFromSQFile: output first]
		ifFalse: [nil]
