testing - platform specific
testUnlockPreviouslyLockedFile
	"The unlock operation will succeed even if no lock is in effect"

	"(self selector: #testUnlockPreviouslyLockedFile) run"

	self should: ((accessor unlockFile: fileStream) isKindOf: OSFileLock).
	accessor lockFile: fileStream.
	self should: ((accessor unlockFile: fileStream) isKindOf: OSFileLock)
