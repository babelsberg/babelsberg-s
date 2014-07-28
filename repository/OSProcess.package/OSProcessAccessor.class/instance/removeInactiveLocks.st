file lock registry
removeInactiveLocks
	"Go through the lock cache and remove any that have been left
	behind after their streams were closed."

	^ self fileLockRegistry copy do: [:ea | ea isActive ifFalse: [self fileLockCache remove: ea]]