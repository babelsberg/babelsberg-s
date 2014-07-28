testing
testLockRegionForRead01
	"Read lock, the local lock request should succeed"

	"(self selector: #testLockRegionForRead01) run"

	| result |
	result := self
		doRemote: [accessor lockFile: fileStream from: 100 to: 199 exclusive: false]
		doLocal: [accessor lockFile: fileStream from: 100 to: 199 exclusive: false].
	self delay wait; wait.
	self assert: (result isKindOf: OSFileRegionLock).
	self assert: (result interval = (100 to: 199)).
	result := accessor unlockFile: fileStream from: 100 to: 199 exclusive: false.
	self assert: (result isKindOf: OSFileRegionLock).
	self assert: (result interval = (100 to: 199))