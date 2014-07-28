file locking
isLockableFile: aFileStream
	"Check for ability to place an exclusive lock on the entire file represented by
	aFileStream. An exclusive lock (write lock) permits only one OS process to hold
	the lock. Answer true if the region is lockable."

	^ self isLockableFile: aFileStream exclusive: true
