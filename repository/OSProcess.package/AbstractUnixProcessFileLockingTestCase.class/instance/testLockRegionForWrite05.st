testing
testLockRegionForWrite05
	"Write lock, nonoverlapping regions, the local lock request should succeed"

	"(self selector: #testLockRegionForWrite05) run"

	| result |
	result := self
		doRemote: [accessor lockFile: fileStream from: 100 to: 199 exclusive: true]
		doLocal: [accessor lockFile: fileStream from: 200 to: 299 exclusive: true].
	self delay wait; wait.
	self assert: (result isKindOf: OSFileRegionLock).
	self assert: (result interval = (200 to: 299)).
	result := accessor unlockFile: fileStream from: 200 to: 299.
	self assert: (result isKindOf: OSFileRegionLock).
	self assert: (result interval = (200 to: 299))