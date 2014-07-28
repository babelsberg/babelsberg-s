testing
testLockEntireFileForWrite02
	"Local lock request should fail"

	"(self selector: #testLockEntireFileForWrite02) run"

	| result |
	result := self
		doRemote:
			[accessor lockFile: fileStream]
		doLocal: [accessor lockFile: fileStream].
	self delay wait; wait.
	self assert: result isNil.
	"Region is in the cache as a result of the (failed) lock request. This is legitimate
	because the lock exists in some other image, so we want to mark it as locked
	locally. However, it is not quite correct because the remote lock may pertain to
	a different but overlapping region. Nevertheless, this seems like reasonable
	behavior."
	result := accessor unlockFile: fileStream.
	self assert: (self isValidUnlockResult: result)
