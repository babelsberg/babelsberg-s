evaluating
value
	"Start the external process"

	self isNotYetRunning ifTrue: [self forkChild; closeStreams]
