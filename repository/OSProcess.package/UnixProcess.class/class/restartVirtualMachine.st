utility
restartVirtualMachine
	"Fork a new instance and quit this one. This moves the running VM into a new
	OS process, and starts a new X display for the new process. It does not reload the
	VM program text, so this cannot be used to restart the VM after rebuild."

	"UnixProcess restartVirtualMachine"

	| proc |
	proc := self forkSqueak.
	proc isNil
		ifTrue: 
			[self noAccessorAvailable.
			nil]
		ifFalse:
			[OSProcess thisOSProcess == proc
				ifFalse:
					["Quit if this is the parent process"
					Smalltalk quitPrimitive]].
	^ proc