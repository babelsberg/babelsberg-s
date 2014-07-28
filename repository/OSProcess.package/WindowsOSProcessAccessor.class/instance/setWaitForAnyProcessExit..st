child process management
setWaitForAnyProcessExit: arrayOfProcessHandleObjects
	"Set up a thread to wait for a process HANDLE to exit, then signal the Semaphore
	at index. This provides asychronous notification of an external process exit. The
	caller should close the thread handle when it is no longer needed."

	"OSProcess command: 'SOL'.
	OSProcess accessor setWaitForAnyProcessExit: OSProcess thisOSProcess activeHandles."

	| threadInfo |
	arrayOfProcessHandleObjects isEmpty ifTrue: [^ nil].
	threadInfo := self
		primSetWaitForAnyProcessExit: arrayOfProcessHandleObjects
		thenSignalSemaphoreWithIndex: self semaIndex.
	^ WindowsThread
		threadID: threadInfo last
		handle: threadInfo first
		running: true

