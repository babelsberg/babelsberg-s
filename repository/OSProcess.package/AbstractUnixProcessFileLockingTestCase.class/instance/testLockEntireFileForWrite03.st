testing
testLockEntireFileForWrite03
	"Local lock request should succeed"

	"(self selector: #testLockEntireFileForWrite03) run"

	| result |
	result := self
		doRemote:
			[accessor lockFile: fileStream.
			accessor unlockFile: fileStream]
		doLocal:
			[accessor lockFile: fileStream].
	self delay wait; wait.
	self assert: (result isKindOf: OSFileLock).
	result := accessor unlockFile: fileStream.
	self assert: (result isKindOf: OSFileLock)