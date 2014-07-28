testing
testLockRegionForWrite03
	"Write lock, nonoverlapping regions, the lock check should succeed"

	"(self selector: #testLockRegionForWrite03) run"

	| result |
	result := self
		doRemote: [accessor lockFile: fileStream from: 100 to: 199 exclusive: true]
		doLocal: [accessor isLockableFile: fileStream from: 200 to: 299 exclusive: true].
	self delay wait; wait.
	self assert: result.
	result := accessor unlockFile: fileStream from: 200 to: 299.
	self assert: (self isValidUnlockResult: result)
