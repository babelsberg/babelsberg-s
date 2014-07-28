instance creation
forkAndExec: executableFile

	"ExternalUnixOSProcess forkAndExec: '/bin/ls'"

	^ super new
		programName: executableFile;
		initialize;
		forkChild
