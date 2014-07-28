evaluating
value
	"Start the external process"

	| procInfo mainThread |
	self isNotYetRunning ifTrue:
		[procInfo := OSProcess accessor primCommand: self commandLine.
		procInfo isNil
			ifTrue:
				[self initialStdErr nextPutAll: 'cannot execute ', self commandLine; cr.
				self exitStatus: #cannotExecuteCommandLine.
				"FIXME: Close the OSPipes now, otherwise the image will block on a read"
				self closeStreams.
				[self complete] fork "defer execution so OSPipes stay in place for now"]
			ifFalse:
				[self pid: (procInfo at: 3).
				self handle: (procInfo at: 1).
				mainThread := WindowsThread
						threadID: (procInfo at: 4)
						handle: (procInfo at: 2)
						running: true.
				self threads add: mainThread.
 				self running.
				OSProcess thisOSProcess registerChildProcess: self.
				"FIXME: Close the initial pipe handles. For now, I have not implemented
				passing these to the child, and there is no support yet for nonblocking
				Windows OS pipes. Once those are available, this method needs to change
				to support."
				self closeStreams]].
