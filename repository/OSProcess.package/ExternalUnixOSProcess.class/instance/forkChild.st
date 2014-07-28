initialize - release
forkChild
	"Start the external OS process. All instances variables except for pid  
	should have been set. The pid will be set following creation of the new 
	external process. Creating a child process is the responsibility of the
	currently executing OS process, so request it to do so on behalf of this
	instance of ExternalUnixOSProcess."

	^ OSProcess thisOSProcess
		processProxy: self
		forkAndExec: programName
		arguments: arguments
		environment: initialEnvironment
		descriptors: (Array
				with: initialStdIn
				with: initialStdOut
				with: initialStdErr)
