instance creation
programName: executableFile arguments: arrayOfStrings initialEnvironment: stringDictionary
	"Answer an instance not yet running."

	^ super new
		programName: executableFile;
		arguments: arrayOfStrings;
		initialEnvironment: stringDictionary
