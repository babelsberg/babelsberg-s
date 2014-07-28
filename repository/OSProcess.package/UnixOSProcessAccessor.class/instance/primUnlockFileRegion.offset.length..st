private - primitive access
primUnlockFileRegion: aSQFileStruct offset: begin length: len
	"Pass a struct SQFile on tthe stack, and unlock the specified region.
	Answer the result of the call to fcntl(). If the region is in the file lock cache,
	remove it, but otherwise ignore the cache. The cache supports Win32 semantics
	within a single Squeak image, but not across separate images, therefore the
	unlock should be attempted regardless of whether this image thinks that the
	region has previously been locked. Answer the result of the call to fcntl()."

	<primitive: 'primitiveUnlockFileRegion' module: 'UnixOSProcessPlugin'>
	^ nil
