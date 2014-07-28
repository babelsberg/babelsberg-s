read, write, position
flush
	"Flush the external OS stream (the one in the C library)."

	OSProcess accessor flushExternalStream: self ioHandle