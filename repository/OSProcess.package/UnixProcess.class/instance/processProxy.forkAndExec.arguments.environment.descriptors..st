child process creation
processProxy: anExternalProcess forkAndExec: executableFile arguments: arrayOfStrings environment: stringDictionary descriptors: arrayOf3Streams
	"Call Unix vfork() and execve() to create a child process, and answer the child process.
	This method is expected to be called by class side methods. Prepare the arguments before
	calling the primitive, including null termination of all strings. anExternalProcess is an
	object which represents the new child process, and which responds to the #pid: message."

	| nullString progName args argVecAndOffsets argVec argOffsets
	envVecAndOffsets envVec envOffsets in out err childPid pwd |
	stdOut ifNil: [^ nil].
	nullString := (Character value: 0) asString.
	progName := executableFile, nullString.		"Null terminated string"
	arrayOfStrings isNil							"Should be a (possibly empty) array"
		ifTrue:
			[args := Array with: progName]		"First argument is the program name (Unix convention)"
		ifFalse:
			[args := (OrderedCollection new: arrayOfStrings size + 2)
						add: progName;
						addAll: (arrayOfStrings collect: [:e | e, nullString ]);	"Null terminate each string"
						yourself;
						asArray].
	argVecAndOffsets := self argsAsFlatArrayAndOffsets: args.
	argVec := argVecAndOffsets at: 1.
	argOffsets := argVecAndOffsets at: 2.
	(stringDictionary notNil and: [stringDictionary ~= (self environment)])
		ifTrue:
			[envVecAndOffsets := self envAsFlatArrayAndOffsets: stringDictionary.
			envVec := envVecAndOffsets at: 1.
			envOffsets := envVecAndOffsets at: 2]
		ifFalse:
			[envVec := nil.
			envOffsets := nil].	"Same as current environment, so just pass nil."
	arrayOf3Streams isNil
		ifTrue:
			[in := self handleFromAccessor: (self stdIn ioHandle).
			out := self handleFromAccessor: (self stdOut ioHandle).
			err := self handleFromAccessor: (self stdIn ioHandle)]
		ifFalse:
			[(arrayOf3Streams at: 1)
				isNil
					ifTrue: [in := self handleFromAccessor: (self stdIn ioHandle)]
					ifFalse: [in := self handleFromFileStream: (arrayOf3Streams at: 1)].			
			(arrayOf3Streams at: 2)
				isNil
					ifTrue: [ out := self handleFromAccessor: (self stdOut ioHandle)]
					ifFalse: [ out := self handleFromFileStream: (arrayOf3Streams at: 2)].
			(arrayOf3Streams at: 3)
				isNil
					ifTrue: [ err := self handleFromAccessor: (self stdErr ioHandle)]
					ifFalse: [ err := self handleFromFileStream: (arrayOf3Streams at: 3)]].
	pwd := anExternalProcess pwd.
	(pwd = self getCwd)
		ifTrue: [pwd := nil]
		ifFalse: [pwd := pwd, nullString].
	childPid := self processAccessor
				forkAndExec: progName
				stdIn: in
				stdOut: out
				stdErr: err
				argBuf: argVec
				argOffsets: argOffsets
				envBuf: envVec
				envOffsets: envOffsets
				workingDir: pwd.
	anExternalProcess pid: childPid.
	anExternalProcess ppid: self pid.
	((childPid == 0) or: [childPid isNil])
		ifTrue:
			[anExternalProcess unknownRunState]
		ifFalse:
			[anExternalProcess running.
			self registerChildProcess: anExternalProcess].
	^ anExternalProcess
