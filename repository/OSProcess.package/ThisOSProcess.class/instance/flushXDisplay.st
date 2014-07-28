display management
flushXDisplay
	"Synchronize output to the X display."

	"self thisOSProcess flushXDisplay"

	^ self processAccessor primFlushXDisplay

