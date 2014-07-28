accessing
childWatcherThread: aThreadObject
	"A thread which signals my sigChldSemaphore when any child process exits."

	childWatcherThread := aThreadObject
