testing
testLockRegionForWrite04
	"Write lock, overlapping regions, the local lock request should fail"

	"(self selector: #testLockRegionForWrite04) run"

	| result |
	result := self
		doRemote: [accessor lockFile: fileStream from: 100 to: 199 exclusive: true]
		doLocal: [accessor lockFile: fileStream from: 150 to: 249 exclusive: true].
	self delay wait; wait.
	self assert: result isNil.
	result := accessor unlockFile: fileStream from: 150 to: 249.
	self assert: (self isValidUnlockResult: result)
