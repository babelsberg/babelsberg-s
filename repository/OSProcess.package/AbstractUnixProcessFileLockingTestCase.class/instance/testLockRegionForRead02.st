testing
testLockRegionForRead02
	"Read lock, the local lock request should fail when requesting a write lock"

	"(self selector: #testLockRegionForRead02) run"

	| result |
	result := self
		doRemote: [accessor lockFile: fileStream from: 100 to: 199 exclusive: true]
		doLocal: [accessor lockFile: fileStream from: 100 to: 199 exclusive: false].
	self delay wait; wait.
	self assert: result isNil.
	result := accessor unlockFile: fileStream from: 100 to: 199.
	self assert: (self isValidUnlockResult: result)
