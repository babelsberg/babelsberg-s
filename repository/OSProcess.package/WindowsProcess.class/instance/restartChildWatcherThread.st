child process management
restartChildWatcherThread
	"Set an exit handler thread to signal when the process exits."


	^ self processAccessor restartChildWatcherThread: self activeHandles
