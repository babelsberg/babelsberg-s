testing
testLockRegionForWrite08
	"Write lock, overlapping regions, the lock check should fail"

	"(self selector: #testLockRegionForWrite08) run"

	| result |
	result := self
		doRemote: [accessor lockFile: fileStream from: 100 to: 199 exclusive: true]
		doLocal: [accessor isLockableFile: fileStream from: 150 to: 299 exclusive: true].
	self delay wait; wait.
	self deny: result.
	result := accessor unlockFile: fileStream from: 150 to: 299.
	self assert: (self isValidUnlockResult: result)
