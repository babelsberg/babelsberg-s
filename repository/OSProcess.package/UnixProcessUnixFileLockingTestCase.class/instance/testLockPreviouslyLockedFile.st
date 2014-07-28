testing - platform specific
testLockPreviouslyLockedFile
	"Locking a previously locked file is permitted"

	"(self selector: #testLockPreviouslyLockedFile) run"

	accessor lockFile: fileStream.
	self should: (accessor isLockableFile: fileStream).
	self should: ((accessor lockFile: fileStream) isKindOf: OSFileLock).
	accessor unlockFile: fileStream