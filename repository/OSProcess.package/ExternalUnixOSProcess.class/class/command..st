instance creation
command: aCommandString

	"ExternalUnixOSProcess command: 'ls -l /etc'"

	^ self forkAndExec: self defaultShellPath
		arguments: (Array with: '-c' with: aCommandString)
		environment: nil