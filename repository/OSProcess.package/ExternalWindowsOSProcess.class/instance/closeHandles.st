initialize - release
closeHandles
	"Clean up after process exits."

	self threads do: [:thread | thread closeHandle].
	handle ifNotNil:
		[OSProcess accessor primCloseHandle: handle.
		handle := nil]
