instance creation
exec: programName
	"Run a program in an external OS process, and answer an instance of myself
	which represents the external process."

	^ self forkAndExec: programName
