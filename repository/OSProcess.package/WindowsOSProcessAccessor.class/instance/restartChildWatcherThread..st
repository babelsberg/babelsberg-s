child process management
restartChildWatcherThread: arrayOfProcessHandleObjects
	"Start a new child watcher thread. If a thread is alread active, terminate
	it before starting a new one."

	self childWatcherThread ifNotNil: [childWatcherThread terminate].
	self childWatcherThread: (self setWaitForAnyProcessExit: arrayOfProcessHandleObjects).
	^ childWatcherThread
