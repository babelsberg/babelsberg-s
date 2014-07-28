testing
testLockRegionForWrite02
	"Write lock, the local lock request should fail"

	"(self selector: #testLockRegionForWrite02) run"

	| result |
	result := self
		doRemote: [accessor lockFile: fileStream from: 100 to: 199 exclusive: true]
		doLocal: [accessor lockFile: fileStream from: 100 to: 199 exclusive: true].
	self delay wait; wait.
	self assert: result isNil.
	"Lock is not in the local cache, so unlock will appear to fail. Actually, the region
	will be unlocked."
	accessor unlockFile: fileStream from: 100 to: 199.
	self assert: result isNil.
