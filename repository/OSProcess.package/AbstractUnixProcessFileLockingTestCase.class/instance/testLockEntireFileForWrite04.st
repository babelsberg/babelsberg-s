testing
testLockEntireFileForWrite04
	"Local lock should be available"

	"(self selector: #testLockEntireFileForWrite04) run"

	| result |
	result := self
		doRemote: [nil]
		doLocal: [accessor isLockableFile: fileStream].
	self delay wait; wait.
	self should: result.
	"No lock on the region, so the unlock should fail."
	result := accessor unlockFile: fileStream.
	self assert: (self isValidUnlockResult: result)
