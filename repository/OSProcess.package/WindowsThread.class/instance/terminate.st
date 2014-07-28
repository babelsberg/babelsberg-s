initialize - release
terminate
	"Force an exit. No cleanup is performed. Use with caution for a thread which
	is (for example) manipulating a mutex."

	(self isRunning and: [self handle notNil]) ifTrue:
		[OSProcess accessor primTerminateThread: self handle.
		self complete]
