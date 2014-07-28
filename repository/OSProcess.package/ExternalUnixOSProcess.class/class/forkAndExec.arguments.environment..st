instance creation
forkAndExec: executableFile arguments: arrayOfStrings environment: stringDictionary 
	"Run a program in an external OS process, and answer an instance of 
	myself which represents the external process."

	"ExternalUnixOSProcess forkAndExec: '/bin/ls' arguments: (Array with: '-l') environment: (UnixProcess env)"

	^ super new
		programName: executableFile;
		arguments: arrayOfStrings;
		initialEnvironment: stringDictionary;
		initialize;
		forkChild
