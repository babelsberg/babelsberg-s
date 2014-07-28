child process creation
command: aCommandString
	"Run a command in a shell process. Similar to the system(3) call in
	the standard C library, except that aCommandString runs asynchronously
	in a child process. Answer an instance of ExternalWindowsProcess which
	is a proxy for the new Windows process."

	"OSProcess command: 'SOL'"

	^ ExternalWindowsOSProcess command: aCommandString
