initialize - release
closeHandle
	"Clean up after thread exits."

	OSProcess accessor primCloseHandle: handle.
	handle := nil
