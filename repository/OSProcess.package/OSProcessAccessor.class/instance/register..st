file lock registry
register: fileRegionLock
	"If an object equal to fileRegionLock exists in the registry, answer it. Otherwise, add
	fileRegionLock to the registry and answer fileRegionLock."

	^ (self fileLockRegistry like: fileRegionLock)
		ifNil: [self fileLockRegistry add: fileRegionLock]
