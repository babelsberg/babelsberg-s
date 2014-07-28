child process management
primSetWaitForAnyProcessExit: arrayOfProcessHandleObjects thenSignalSemaphoreWithIndex: index
	"Set up a thread to wait for a process HANDLE to exit, then signal the Semaphore
	at index. This provides asychronous notification of an external process exit."

	<primitive: 'primitiveSetWaitForAnyProcessExitThenSignalSemaphoreWithIndex' module: 'Win32OSProcessPlugin'>

	^ nil