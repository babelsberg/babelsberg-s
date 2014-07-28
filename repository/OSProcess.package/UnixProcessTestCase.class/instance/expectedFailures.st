failures
expectedFailures
	^UnixOSProcessAccessor basicNew safeToForkSqueak
		ifTrue: [#()]
		ifFalse: [#(	testClassForkHeadlessSqueakAndDo
					testClassForkHeadlessSqueakAndDoThenQuit
					testClassForkSqueak
					testClassForkSqueakAndDo
					testClassForkSqueakAndDoThenQuit
					testEightLeafSqueakTree
					testForkHeadlessSqueakAndDo
					testForkHeadlessSqueakAndDoThenQuit
					testForkSqueak
					testForkSqueakAndDo
					testForkSqueakAndDoThenQuit
					testHeadlessChild
					testSpawnTenHeadlessChildren)]