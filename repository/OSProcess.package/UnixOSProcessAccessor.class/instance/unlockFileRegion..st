file locking
unlockFileRegion: aFileLock
	"Pass a struct SQFile on the stack, and unlock the specified region.
	Answer the result of the call to fcntl(). If the region is in the file lock cache,
	remove it, but otherwise ignore the cache. The cache supports Win32 semantics
	within a single Squeak image, but not across separate images, therefore the
	unlock should be attempted regardless of whether this image thinks that the
	region has previously been locked. Answer a descriptor for the unlocked file
	region, an Array of file handle and region interval; or answer nil on error
	or if the region did not appear in the cache.

	Warning: The registry permits compatibility with Win32 file locking semantics,
	but only within a single Squeak image. Multiple cooperating images must not
	rely on the overlap checking, because the registry is local to this image and
	cannot be shared across images in different OS process contexts."

	^ self unlockFileRegion: aFileLock ifFail: [nil]
