private - primitive access
primLockFileRegion: aSQFileStruct offset: begin length: len exclusive: flag
	"Pass a struct SQFile on the stack, and request a lock on the specified region.
	If the exclusive flag is true, then request an exclusive (F:=WRLCK) lock on the
     file. Otherwise, request a shared (F:=RDLCK) lock. Any number of Unix processes
     may  hold  a read lock (shared lock) on a file region, but only one process may
     hold a write lock (exclusive lock). Answer the result of the call to fcntl()."

	<primitive: 'primitiveLockFileRegion' module: 'UnixOSProcessPlugin'>
	^ nil
