file locking
lockFileRegion: aFileLock ifFail: failBlock
	"Pass a struct SQFile on the stack, and request a lock on the specified region.
	If the exclusive flag is true, then request an exclusive (F:=WRLCK) lock on the
     file. Otherwise, request a shared (F:=RDLCK) lock. Any number of Unix processes
     may hold a read lock (shared lock) on a file region, but only one process may
     hold a write lock (exclusive lock). Answer a descriptor for the locked file region,
	an Array of file handle and region interval; or answer nil on error.

	If length is zero, then the request is for the entire file to be locked, including
	region extents that have not yet been allocated for the file.

	Warning: The registry permits compatibility with Win32 file locking semantics,
	but only within a single Squeak image. Multiple cooperating images must not
	rely on the overlap checking, because the registry is local to this image and
	cannot be shared across images in different OS process contexts."

	aFileLock ifNil: [^ failBlock value].
	"Check region lock overlap for Win32 compatibility"
	(self canAcquireLock: aFileLock) ifFalse: [^ failBlock value].
	
	aFileLock lock
		ifFalse: [^ failBlock value]
		ifTrue:
			[self register: aFileLock.
			^ aFileLock]
