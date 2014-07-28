standard IO handles
getStdIn
	"Answer an IO handle (representing a SQFile data structure in interp.c) for the standard
	input for the OS process in which I am currently executing, or nil if the IO handle
	cannot be obtained."

	"OSProcess accessor getStdIn"

	| input |
	input := self primGetStdInputForSession: self sessionIdentifier.
	^ (input notNil and: [input last])
		ifTrue: [self ioAccessorFromSQFile: input first]
		ifFalse: [nil]
