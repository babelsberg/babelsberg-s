child process creation
squeak
	"Start a new instance of Squeak running in a child OS process. The new 
	instance will restart from the image file, so it is a clone of this image 
	as it existed at the most recent image save."

	"OSProcess thisOSProcess squeak"

	^ self
		forkJob: self programName
		arguments: self arguments
		environment: nil
		descriptors: nil