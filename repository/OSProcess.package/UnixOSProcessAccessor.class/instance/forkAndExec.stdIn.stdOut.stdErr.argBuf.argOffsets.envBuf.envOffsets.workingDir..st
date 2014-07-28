fork and exec
forkAndExec: executableFile
	stdIn: inputFileHandle
	stdOut: outputFileHandle
	stdErr: errorFileHandle
	argBuf: argVec
	argOffsets: argOffsets
	envBuf: envVec
	envOffsets: envOffsets
	workingDir: pathString

	"Parameters are expected to have been properly prepared by the caller, including string
	values which are to be null terminated strings. In other words, all strings should have
	(Character value: 0) as the last element in the string.

	Parameters should be:
		executableFile: a string with the name of a file to execute.
		stdIn: a fileID ByteArray (struct SQFile in C) to be used as standard input.
		stdOut: a fileID ByteArray to be used as standard output.
		stdErr: a fileID ByteArray to be used as standard error.
		argVec: a String arranged to look more or less like a char **, but with the addresses not yet fixed.
		argOffsets: an Array of offsets for fixing up the argVec addresses.
		envVec: a String arranged to look more or less like a char **, but with the addresses not yet fixed.
		envOffsets: an Array of offsets for fixing up the envVec addresses.
		workingDir: a null terminated path name String, or nil.
	The envVec parameter may be nil, in which case envOffsets is ignored. workingDir may be nil. The
	other parameters are required. Parameters with nil value indicate that current values for this process
	should be used."

	^ self primForkExec: executableFile
			stdIn: inputFileHandle
			stdOut: outputFileHandle
			stdErr: errorFileHandle
			argBuf: argVec
			argOffsets: argOffsets
			envBuf: envVec
			envOffsets: envOffsets
			workingDir: pathString
