examples
cloneSqueak
	"Start a new instance of Squeak running in a child OS process. The new instance is a
	nearly identical copy of its parent, resuming execution at the same point as the
	parent, and differentiated only by the return value of this method."

	"UnixProcess cloneSqueak"

	| proc |
	proc := self forkSqueak.
	proc ifNil: [self noAccessorAvailable].
	^ proc
