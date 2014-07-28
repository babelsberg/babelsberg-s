file lock registry
registeredLocksForFile: aFileStream
	"Answer all lock descriptors associated with aFileStream"

	^ self fileLockRegistry select: [:ea | ea fileStream = aFileStream]
