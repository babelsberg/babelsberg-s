external command processing
command: aCommandString
	"Run a command in a shell process. Similar to the system(3) call in the standard C library,
	except that aCommandString runs asynchronously in a child process."

	"OSProcess command: 'ls -l /etc'"

	^ self thisOSProcess command: aCommandString
