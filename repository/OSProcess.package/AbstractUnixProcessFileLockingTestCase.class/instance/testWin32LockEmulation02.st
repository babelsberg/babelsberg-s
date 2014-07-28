testing
testWin32LockEmulation02
	"Make sure the cache does what is expected, and that it can be disabled.
	Expect exclusive read-write locks to be protected by the cache."

	"(self selector: #testWin32LockEmulation02) run"

	| result |
	accessor class emulateWin32FileLocking: true.
	result := accessor lockFile: fileStream from: 100 to: 199 exclusive: true.
	self assert: (result isKindOf: OSFileRegionLock).
	self assert: (result interval = (100 to: 199)).
	result := accessor lockFile: fileStream from: 100 to: 199 exclusive: true.
	self assert: result isNil.
	result := accessor unlockFile: fileStream from: 100 to: 199 exclusive: true.
	self assert: (result isKindOf: OSFileRegionLock).
	self assert: (result interval = (100 to: 199))
