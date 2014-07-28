external command processing
waitForCommandOutput: aCommandString 
	"Run a command in a shell process. Similar to the system(3) call in the 
	standard C library. The active Smalltalk process waits for completion of
	the external command process."

	"OSProcess thisOSProcess waitForCommandOutput: 'echo sleeping...; sleep 1; echo I just slept for one second'"
	"OSProcess thisOSProcess waitForCommandOutput: 'ThisIsABogusCommand'"
	"OSProcess thisOSProcess waitForCommandOutput: '/bin/ls -l /etc /bin'"
	"OSProcess thisOSProcess waitForCommandOutput: 'echo Hello world!; ls /NOSUCHFILE'"

	(Smalltalk hasClassNamed: #PipeableOSProcess)
		ifTrue:
			[^ ((Smalltalk at: #PipeableOSProcess) command: aCommandString) output]
		ifFalse:
			[self notify: 'the #waitForCommandOutput: method requires CommandShell'.
			^ '']
