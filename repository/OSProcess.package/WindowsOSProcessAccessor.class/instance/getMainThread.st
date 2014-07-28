external process access
getMainThread
	"Answer the main thread of this OS process. The handle for this thread is a
	pseudo-handle, and cannot be used to terminate the thread."

	"OSProcess accessor getMainThread"

	^ WindowsThread threadID: self primGetPid handle: self primGetPidHandle running: true
