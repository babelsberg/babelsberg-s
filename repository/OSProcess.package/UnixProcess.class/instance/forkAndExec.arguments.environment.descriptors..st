child process creation
forkAndExec: executableFile arguments: arrayOfStrings environment: stringDictionary descriptors: arrayOf3Streams 

	"Call Unix vfork() and execve() to create a child process, and answer the 
	child process. This method is expected to be called by class side methods."

	^ ExternalUnixOSProcess
		forkAndExec: executableFile
		arguments: arrayOfStrings
		environment: stringDictionary
		descriptors: arrayOf3Streams