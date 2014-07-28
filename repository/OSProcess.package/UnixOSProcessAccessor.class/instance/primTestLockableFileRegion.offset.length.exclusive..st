private - primitive access
primTestLockableFileRegion: aSQFileStruct offset: begin length: len exclusive: flag
	"Pass a struct SQFile on the stack, and check for ability to lock the specified region.
	If the exclusive flag is true, then specify an exclusive (F:=WRLCK) lock on the
     file. Otherwise, specify a shared (F:=RDLCK) lock. Any number of Unix processes
     may hold  a read lock (shared lock) on a file region, but only one process may
     hold a write lock (exclusive lock).

	If length is zero, then the request is for the entire file to be locked, including
	region extents that have not yet been allocated for the file.

	If the fcntl() call fails, answer -1 (the result of the failed call). Otherwise,
	answer an array with the following six fields:
		lockable (true or false)
		l:=pid (pid of the process preventing this lock request, or nil)
		l:=type (request type F:=WRLCK or F:=RDLOCK of the process preventing this lock request)
		l:=whence (the SEEK:=SET, SEEK:=CUR, or SEEK:=END value of the lock preventing this lock request).
		l:=start (offset of the region lock preventing this lock request)
		l:=len (length of the region lock preventing this lock request)"

	<primitive: 'primitiveTestLockableFileRegion' module: 'UnixOSProcessPlugin'>
	^ nil
