testing
testLockEntireFileForWrite05
	"Local lock should be available"

	"(self selector: #testLockEntireFileForWrite05) run"

	| result |
	result := self
		doRemote:
			[accessor lockFile: fileStream]
		doLocal: [accessor isLockableFile: fileStream].
	self delay wait; wait.
	self shouldnt: result.
	"No local lock in the cache for this file, so the unlock call will appear to fail.
	Actually, it will have passed the unlock request through to the operating system,
	and it will actually unlock the file."
	result := accessor unlockFile: fileStream.
	self assert: (self isValidUnlockResult: result)
