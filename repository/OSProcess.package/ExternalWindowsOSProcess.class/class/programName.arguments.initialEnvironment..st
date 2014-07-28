instance creation
programName: executableFile arguments: arrayOfStrings initialEnvironment: stringDictionary
	"This is for protocol compatibility with ExternalUnixOSProcess. For now, just reassemble
	a command line string and ignore the environment argument."

	| commandLine |
	commandLine := WriteStream on: String new.
	commandLine nextPutAll: executableFile.
	arrayOfStrings ifNotNil:
		[arrayOfStrings do: [:arg | commandLine nextPut: Character space; nextPutAll: arg]].
	^ self commandNoEvaluate: commandLine contents
