initialize - release
restartChildWatcherProcess
	"OSProcess accessor restartChildWatcherProcess"

	self finalize.
	^ self grimReaperProcess
