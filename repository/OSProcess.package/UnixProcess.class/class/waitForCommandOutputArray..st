external command processing
waitForCommandOutputArray: aCommandString
	"Run a command in a shell process. Similar to the system(3) call in the standard C library.
	The active Smalltalk process waits for completion of the external command process."

	"UnixProcess waitForCommandOutputArray: 'echo Hello world!; ls /NOSUCHFILE'"

	^ self thisOSProcess waitForCommandOutputArray: aCommandString