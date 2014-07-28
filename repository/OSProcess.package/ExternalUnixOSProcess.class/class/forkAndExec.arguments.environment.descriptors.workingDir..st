instance creation
forkAndExec: executableFile arguments: arrayOfStrings environment: stringDictionary descriptors: arrayOf3Streams workingDir: pathString
	"Run a program in an external OS process, and answer an instance of myself
	which represents the external process."

	"ExternalUnixOSProcess forkAndExec: '/bin/ls' arguments: nil environment: nil descriptors: nil workingDir: '/etc'"

	| proc |
	proc := super new
		programName: executableFile;
		arguments: arrayOfStrings;
		initialEnvironment: stringDictionary.
	arrayOf3Streams ifNotNil:
		[proc initialStdIn: (arrayOf3Streams at: 1).
		proc initialStdOut: (arrayOf3Streams at: 2).
		proc initialStdErr: (arrayOf3Streams at: 3)].
	pathString ifNotNil: [proc pwd: pathString].
	^ proc initialize forkChild
