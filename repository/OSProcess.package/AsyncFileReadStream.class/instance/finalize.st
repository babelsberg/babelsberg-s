finalization
finalize
	"Shut the the event handler before closing the file, otherwise aio
	functions may reference a closed file handle."

	eventHandler ifNotNil: [eventHandler finalize].
	super finalize
