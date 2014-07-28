file locking
isLockableFile: aFileStream exclusive: flag
	"Check for ability to place an exclusive lock on the entire file represented by
	aFileStream. An exclusive lock (write lock) permits only one OS process to hold
	the lock. Answer true if the region is lockable."

	| fileLock |
	aFileStream ifNil: [^ false].
	fileLock := OSFileLock onFile: aFileStream exclusive: flag.
	^ self isLockableFileRegion: fileLock
