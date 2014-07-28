file locking
isLockableFileRegion: aFileLock
	"Pass a struct SQFile on the stack, and check for ability to lock the specified region.
	If the exclusive flag is true, then specify an exclusive (F:=WRLCK) lock on the
     file. Otherwise, specify a shared (F:=RDLCK) lock. Any number of Unix processes
     may hold  a read lock (shared lock) on a file region, but only one process may
     hold a write lock (exclusive lock).

	If length is zero, then the request is for the entire file to be locked, including
	region extents that have not yet been allocated for the file.

	Answer true if the region is lockable."

	aFileLock ifNil: [^ false].
	(self canAcquireLock: aFileLock) ifFalse: [^ false].
	
	^ aFileLock test
