environment
getCwd
	"Get current working directory. If this cannot be obtained from the
	environment, answer a reasonable default."

	"OSProcess thisOSProcess getCwd"

	^ self processAccessor primGetCurrentWorkingDirectory
		ifNil: [OSProcess defaultPathString]


