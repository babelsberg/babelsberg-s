testing - platform specific
testLockPreviouslyLockedFile
	"A previously locked file cannot be locked."

	"(self selector: #testLockPreviouslyLockedFile) run"

	accessor lockFile: fileStream.
	self shouldnt: (accessor isLockableFile: fileStream).
	self should: (accessor lockFile: fileStream) isNil.
	accessor unlockFile: fileStream