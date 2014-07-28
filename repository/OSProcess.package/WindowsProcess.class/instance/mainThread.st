accessing
mainThread
	"The main thread for this OS process. The handle for this thread is a
	pseudo-handle, and cannot be used to close the main thread."

	^ mainThread ifNil: [mainThread := processAccessor getMainThread]