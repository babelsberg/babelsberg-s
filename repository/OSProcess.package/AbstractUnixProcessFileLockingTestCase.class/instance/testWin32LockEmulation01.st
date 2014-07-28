testing
testWin32LockEmulation01
	"Make sure the cache does what is expected, and that it can be disabled
	Expect non-exclusive read locks to to succeed."

	"(self selector: #testWin32LockEmulation01) run"

	| result |
	accessor class emulateWin32FileLocking: true.
	result := accessor lockFile: fileStream from: 100 to: 199 exclusive: false.
	self assert: (result isKindOf: OSFileRegionLock).
	self assert: (result interval = (100 to: 199)).
	result := accessor lockFile: fileStream from: 100 to: 199 exclusive: false.
	self assert: (result isKindOf: OSFileRegionLock).
	self assert: (result interval = (100 to: 199)).
	result := accessor unlockFile: fileStream from: 100 to: 199 exclusive: false.
	self assert: (result isKindOf: OSFileRegionLock).
	self assert: (result interval = (100 to: 199))
