read, write, position
upTo: delim 

	^ self readSyncSemaphore critical: [self readBuffer upTo: delim]
