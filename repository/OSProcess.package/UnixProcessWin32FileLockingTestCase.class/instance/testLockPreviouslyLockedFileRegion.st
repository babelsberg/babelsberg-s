testing - platform specific
testLockPreviouslyLockedFileRegion
	"A previously locked file region cannot be locked."

	"(self selector: #testLockPreviouslyLockedFileRegion) run"

	accessor
		lockFile: fileStream
		from: 100
		to: 199
		exclusive: true.
	self shouldnt: (accessor
		isLockableFile: fileStream
		from: 100
		to: 199
		exclusive: true).
	self should: ((accessor
		lockFile: fileStream
		from: 100
		to: 199
		exclusive: true) isNil).
	accessor unlockFile: fileStream