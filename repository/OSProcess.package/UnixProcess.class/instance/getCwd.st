environment
getCwd
	"Get current working directory. At image startup, this is equivalent to
	evaluating environmentAt: #PWD"

	"OSProcess thisOSProcess getCwd"

	^ self processAccessor primGetCurrentWorkingDirectory


