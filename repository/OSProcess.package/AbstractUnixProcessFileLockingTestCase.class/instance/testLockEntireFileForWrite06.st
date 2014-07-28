testing
testLockEntireFileForWrite06
	"Local lock should be available"

	"(self selector: #testLockEntireFileForWrite06) run"

	| result |
	result := self
		doRemote:
			[accessor lockFile: fileStream.
			accessor unlockFile: fileStream]
		doLocal:
			[accessor isLockableFile: fileStream].
	self delay wait; wait.
	self should: result.
	"No local lock in the cache for this file, so the unlock call will appear to fail.
	Actually, it will have passed the unlock request through to the operating system,
	but it will have no effect because the file was never locked."
	result := accessor unlockFile: fileStream.
	self assert: (self isValidUnlockResult: result)
