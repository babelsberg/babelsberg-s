external command processing
waitForCommand: aCommandString
	"Run a command in a shell process. Similar to the system(3) call in the standard C library.
	The active Smalltalk process waits for completion of the external command process."

	"OSProcess waitForCommand: 'echo sleeping...; sleep 3; echo I just slept for three seconds'"

	^ self thisOSProcess waitForCommand: aCommandString
