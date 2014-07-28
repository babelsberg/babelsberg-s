accessing
processHandle
	"The handle for this OS process. This is a pseudo-handle, a constant provided
	by Windows to represent the process. Note that the main thread handle is also
	represented by a pseudo-handle."

	^ processHandle ifNil: [processHandle := self processAccessor primGetPidHandle]
