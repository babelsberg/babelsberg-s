testing - class side methods
testClassForkHeadlessSqueakAndDoThenQuit

	"(UnixProcessTestCase selector: #testClassForkHeadlessSqueakAndDoThenQuit) run"

	| p openFileCount |
	openFileCount := self numberOfOpenFiles.
	self shouldnt:
		[p := UnixProcess forkHeadlessSqueakAndDoThenQuit:
			[(Delay forMilliseconds: 100) wait]]
		raise: Warning. "Catch warning if fork fails"
	self assert: p notNil.
	(p == thisOSProcess)
		ifFalse:
			["Parent Squeak process"
			self should: [p isRunning].
			[p isRunning] whileTrue: [(Delay forMilliseconds: 100) wait].
			self should: [p isComplete].
			self should: [p exitStatus == 0].
			self assert: self numberOfOpenFiles == openFileCount]
