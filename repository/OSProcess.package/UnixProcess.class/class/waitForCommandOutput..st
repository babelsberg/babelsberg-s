external command processing
waitForCommandOutput: aCommandString 
	"Run a command in a shell process. Similar to the system(3) call in the 
	standard C library. The active Smalltalk process waits for completion of
	the external command process."

	"UnixProcess waitForCommandOutput: 'echo sleeping...; sleep 1; echo I just slept for one second'"
	"UnixProcess waitForCommandOutput: 'ThisIsABogusCommand'"

	^ self thisOSProcess waitForCommandOutput: aCommandString
