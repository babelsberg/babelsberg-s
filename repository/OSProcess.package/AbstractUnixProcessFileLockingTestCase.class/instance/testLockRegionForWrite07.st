testing
testLockRegionForWrite07
	"Write lock, overlapping regions, the lock check should fail"

	"(self selector: #testLockRegionForWrite07) run"

	| result |
	result := self
		doRemote: [accessor lockFile: fileStream from: 100 to: 199 exclusive: true]
		doLocal: [accessor isLockableFile: fileStream from: 100 to: 199 exclusive: true].
	self delay wait; wait.
	self deny: result.
	result := accessor unlockFile: fileStream from: 100 to: 199.
	self assert: (self isValidUnlockResult: result)
