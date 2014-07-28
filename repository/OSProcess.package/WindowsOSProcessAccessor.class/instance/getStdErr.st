standard IO handles
getStdErr
	"Answer an IO handle (representing a SQFile data structure in interp.c) for the standard
	error for the OS process in which I am currently executing, or nil if the IO handle
	cannot be obtained."

	"OSProcess accessor getStdErr"

	| error |
	error := self primGetStdErrorForSession: self sessionIdentifier.
	^ (error notNil and: [error last])
		ifTrue: [self ioAccessorFromSQFile: error first]
		ifFalse: [nil]
