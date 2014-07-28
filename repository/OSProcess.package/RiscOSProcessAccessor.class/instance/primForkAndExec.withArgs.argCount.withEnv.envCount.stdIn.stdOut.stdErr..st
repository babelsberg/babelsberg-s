fork and exec
primForkAndExec: executableFile
	withArgs: anArrayOfArgumentStrings
	argCount: numberOfArgumentStrings
	withEnv: anArrayOfEnvironmentStrings
	envCount: numberOfEnvironmentStrings
	stdIn: inputFileHandle
	stdOut: outputFileHandle
	stdErr: errorFileHandle
	"Parameters are expected to have been properly prepared by the caller,
	including string values which are to be null terminated strings.
	In other words, all strings should have (Character value: 0) as the
	last element in the string."