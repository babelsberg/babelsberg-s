file lock registry
canAcquireLock: anOSFileLockDescriptor
	"Answer true if the file lock cache will permit fileLock to be acquired. This method
	does not guarantee that the underlying OS will grant the lock."

	^ (self fileLockRegistry anySatisfy:
			[:ld | ld isActive and: [ld conflictsWith: anOSFileLockDescriptor]]) not