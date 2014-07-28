testing
testLockEntireFileForWrite01
	"Local lock request should succeed"

	"(self selector: #testLockEntireFileForWrite01) run"

	| result |
	result := self
		doRemote: [nil]
		doLocal: [accessor lockFile: fileStream].
	self delay wait; wait.
	self assert: (result isKindOf: OSFileLock).
	result := accessor unlockFile: fileStream.
	self assert: (result isKindOf: OSFileLock)
