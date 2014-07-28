testing - platform specific
testLockPreviouslyLockedFileRegion
	"Locking a previously locked file region is permitted"

	"(self selector: #testLockPreviouslyLockedFileRegion) run"

	accessor
		lockFile: fileStream
		from: 100
		to: 199
		exclusive: true.
	self should: (accessor
		isLockableFile: fileStream
		from: 100
		to: 199
		exclusive: true).
	self should: ((accessor
		lockFile: fileStream
		from: 100
		to: 199
		exclusive: true)
		isKindOf: OSFileLock).
	accessor unlockFile: fileStream