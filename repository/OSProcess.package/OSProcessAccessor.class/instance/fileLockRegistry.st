file lock registry
fileLockRegistry

	^ FileLockRegistry ifNil: [FileLockRegistry := Set new]
