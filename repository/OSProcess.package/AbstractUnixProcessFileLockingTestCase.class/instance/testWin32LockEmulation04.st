testing
testWin32LockEmulation04
	"Make sure the cache does what is expected, and that it can be disabled.
	Expect the cache to allow a lock after the stream has been closed (since the OS will have freed its lock)"

	"(self selector: #testWin32LockEmulation04) run"

	| result stream2 |
	accessor class emulateWin32FileLocking: true.
	stream2 := FileStream fileNamed: 'junkfile'.
	[result := accessor lockFile: stream2 from: 100 to: 199 exclusive: true.
	self assert: (result isKindOf: OSFileRegionLock).
	self assert: (result interval = (100 to: 199))]
		ensure: [stream2 close].
	result := accessor lockFile: fileStream from: 100 to: 199 exclusive: true.
	self assert: (result isKindOf: OSFileRegionLock).
	self assert: (result interval = (100 to: 199)).
	result := accessor unlockFile: fileStream from: 100 to: 199 exclusive: true.
	self assert: (result isKindOf: OSFileRegionLock).
	self assert: (result interval = (100 to: 199))