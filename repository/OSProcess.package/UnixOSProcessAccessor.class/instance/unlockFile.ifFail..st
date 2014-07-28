file locking
unlockFile: aFileStream ifFail: failBlock
	"Unlock the file represented by aFileStream.  Answer a descriptor for the unlocked
	file region, an Array of file handle and region interval; or answer nil on error
	or if the region did not appear in the cache.

	Warning: The registry permits compatibility with Win32 file locking semantics,
	but only within a single Squeak image. Multiple cooperating images must not
	rely on the overlap checking, because the registry is local to this image and
	cannot be shared across images in different OS process contexts."

	^ self unlockFile: aFileStream exclusive: true ifFail: failBlock
