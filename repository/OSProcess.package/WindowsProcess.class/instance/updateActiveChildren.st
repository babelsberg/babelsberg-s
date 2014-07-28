child process management
updateActiveChildren

	super updateActiveChildren.
	self restartChildWatcherThread
