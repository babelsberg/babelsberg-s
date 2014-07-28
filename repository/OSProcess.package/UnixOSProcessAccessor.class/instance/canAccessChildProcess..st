testing
canAccessChildProcess: anExternalProcess
	"Is the child process still there? Maybe not if we have restarted the image
	and anExternalProcess refers to a process which died while we were not
	watching."

	^ self primCanReceiveSignals: anExternalProcess pid