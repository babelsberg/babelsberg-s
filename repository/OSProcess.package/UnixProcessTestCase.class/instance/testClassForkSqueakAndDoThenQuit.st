testing - class side methods
testClassForkSqueakAndDoThenQuit

	"(UnixProcessTestCase selector: #testClassForkSqueakAndDoThenQuit) run"

	| p openFileCount |
	openFileCount := self numberOfOpenFiles.
	self shouldnt:
			[p := UnixProcess forkSqueakAndDoThenQuit:
					[(Delay forMilliseconds: 100) wait]]
		raise: Warning.
	self assert: p notNil.
	(p == thisOSProcess)
		ifFalse:
			["Parent Squeak process"
			self should: [p isRunning].
			[p isRunning] whileTrue: [(Delay forMilliseconds: 100) wait].
			self should: [p isComplete].
			self should: [p exitStatus == 0].
			self assert: self numberOfOpenFiles == openFileCount]
