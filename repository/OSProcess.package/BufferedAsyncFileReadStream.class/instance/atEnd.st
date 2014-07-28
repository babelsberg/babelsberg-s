testing
atEnd
	"Answer whether the receiver can access any more objects.

	Warning: If this instance represents the reader end of an OS pipe, it
	is possible for the #atEnd test to give a false negative. In particular, after
	closing the writer end of an empty OSPipe, the reader may not appear to
	be atEnd until some time has elapsed, or until an explicit read on the pipe
	causes the status to be updated. To illustrate the problem:

		(OSPipe new setBufferedReader; yourself) closeWriter; atEnd>>false
		(OSPipe new ) closeWriter; next; yourself; atEnd>>true
		(OSPipe new setBufferedReader; yourself) closeWriter; next; yourself; atEnd>>true"

	^ self readSyncSemaphore
		critical: [self readBuffer atEnd
				and: [super atEnd]]