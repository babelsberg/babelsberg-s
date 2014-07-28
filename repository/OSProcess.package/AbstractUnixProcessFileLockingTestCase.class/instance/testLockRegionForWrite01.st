testing
testLockRegionForWrite01
	"Local lock request should succeed"

	"(self selector: #testLockRegionForWrite01) run"

	| result |
	result := self
		doRemote: [nil]
		doLocal: [accessor lockFile: fileStream from: 100 to: 199 exclusive: true].
	self delay wait; wait.
	self assert: (result isKindOf: OSFileRegionLock).
	self assert: (result interval = (100 to: 199)).
	result := accessor unlockFile: fileStream from: 100 to: 199.
	self assert: (result isKindOf: OSFileRegionLock).
	self assert: (result interval = (100 to: 199))