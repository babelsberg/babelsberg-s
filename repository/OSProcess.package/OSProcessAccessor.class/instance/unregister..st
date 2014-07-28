file lock registry
unregister: fileRegionLock
	"If an object equal to fileRegionLock exists in the registry, remove it and
	answer the object. Otherwise answer nil."


	^ self fileLockRegistry remove: fileRegionLock ifAbsent: [nil]
