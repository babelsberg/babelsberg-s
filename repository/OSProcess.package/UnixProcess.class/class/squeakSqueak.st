examples
squeakSqueak
	"Start a new instance of Squeak running in a child OS process. The new instance
	will restart from the image file, so it is a clone of this image as it existed at the
	most recent image save. See cloneSqueak for an example of how to clone the
	running image without going back to the saved image file."

	"UnixProcess squeakSqueak"

	| proc |
	proc := self squeak.
	proc ifNil: [self noAccessorAvailable].
	^ proc
