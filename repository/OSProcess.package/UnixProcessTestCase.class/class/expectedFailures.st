failures
expectedFailures
	^UnixOSProcessAccessor basicNew safeToForkSqueak
		ifTrue: [#()]
		ifFalse: [#(	testClassForkHeadlessSqueakAndDo
					testClassForkHeadlessSqueakAndDoThenQuit
					testClassForkSqueak
					testClassForkSqueakAndDo
					testClassForkSqueakAndDoThenQuit
					testForkHeadlessSqueakAndDo
					testForkHeadlessSqueakAndDoThenQuit
					testForkSqueak
					testForkSqueakAndDo
					testForkSqueakAndDoThenQuit
					testHeadlessChild
					testSpawnTenHeadlessChildren)]