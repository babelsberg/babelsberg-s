instance creation
command: aCommandString

	"ExternalWindowsOSProcess command: 'SOL'"
	"ExternalWindowsOSProcess command: 'NoSuchProgram'"

	^ (self commandNoEvaluate: aCommandString) value
