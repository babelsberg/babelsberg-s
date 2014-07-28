file locking
lockFile: aFileStream exclusive: flag
	"Request an exclusive lock on the entire file represented by aFileStream. The
	exclusive lock (write lock) permits only one OS process to hold the lock. Answer
	a descriptor for the locked file region, an Array of file handle and region interval;
	or answer nil on error.

	Warning: The registry permits compatibility with Win32 file locking semantics,
	but only within a single Squeak image. Multiple cooperating images must not
	rely on the overlap checking, because the registry is local to this image and
	cannot be shared across images in different OS process contexts."

	^ self lockFile: aFileStream exclusive: flag ifFail: nil
