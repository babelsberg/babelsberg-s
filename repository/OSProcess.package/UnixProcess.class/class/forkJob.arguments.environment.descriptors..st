child process creation
forkJob: executableFile arguments: arrayOfStrings environment: stringDictionary descriptors: arrayOf3Streams 
	"Call Unix vfork() and execve() to create a child process, and answer the 
	child process. Delegate this to the singleton OSProcess>>thisOSProcess."

	^ self thisOSProcess
		forkJob: executableFile
		arguments: arrayOfStrings
		environment: stringDictionary
		descriptors: arrayOf3Streams