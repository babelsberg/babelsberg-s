testing - platform specific
testUnlockPreviouslyLockedFileRegion
	"The unlock operation will succeed even if no lock is in effect"

	"(self selector: #testUnlockPreviouslyLockedFileRegion) run"

	self should: ((accessor
		unlockFile: fileStream
		from: 100
		to: 199
		exclusive: true) isKindOf: OSFileLock).
	accessor
		lockFile: fileStream
		from: 100
		to: 199
		exclusive: true.
	self should: ((accessor
		unlockFile: fileStream
		from: 100
		to: 199
		exclusive: true) isKindOf: OSFileLock)
