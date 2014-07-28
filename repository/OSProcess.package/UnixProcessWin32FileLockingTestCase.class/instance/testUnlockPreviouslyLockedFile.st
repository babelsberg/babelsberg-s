testing - platform specific
testUnlockPreviouslyLockedFile
	"The unlock operation will fail if lock is in effect"

	"(self selector: #testUnlockPreviouslyLockedFile) run"

	self shouldnt: ((accessor unlockFile: fileStream) isKindOf: OSFileLock).
	accessor lockFile: fileStream.
	self should: ((accessor unlockFile: fileStream) isKindOf: OSFileLock).
	self shouldnt: ((accessor unlockFile: fileStream) isKindOf: OSFileLock)
