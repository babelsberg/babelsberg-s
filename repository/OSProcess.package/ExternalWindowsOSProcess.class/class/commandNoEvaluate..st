instance creation
commandNoEvaluate: aCommandString
	"Answer an instance not yet running."

	"ExternalWindowsOSProcess commandNoEvaluate: 'SOL'"

	^ super new
		commandLine: aCommandString;
		ppid: OSProcess thisOSProcess pid;
		notYetRunning
