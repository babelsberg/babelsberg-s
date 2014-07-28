testing
testWin32LockEmulation03
	"Make sure the cache does what is expected, and that it can be disabled.
	Expect the cache to protect the file even if we open a second stream"

	"(self selector: #testWin32LockEmulation03) run"

	| result stream2 |
	accessor class emulateWin32FileLocking: true.
	result := accessor lockFile: fileStream from: 100 to: 199 exclusive: true.
	self assert: (result isKindOf: OSFileRegionLock).
	self assert: (result interval = (100 to: 199)).
	stream2 := FileStream fileNamed: 'junkfile'.
	[result := accessor lockFile: stream2 from: 100 to: 199 exclusive: true.
	self assert: result isNil]
		ensure: [stream2 close].
	result := accessor unlockFile: fileStream from: 100 to: 199 exclusive: true.
	self assert: (result isKindOf: OSFileRegionLock).
	self assert: (result interval = (100 to: 199))
