testing - class side methods
testClassForkSqueak

	"(UnixProcessTestCase selector: #testClassForkSqueak) run"

	| p openFileCount |
	openFileCount := self numberOfOpenFiles.
	self shouldnt: [p := UnixProcess forkSqueak]
		raise: Warning.
	self assert: p notNil.
	(p == thisOSProcess)
		ifTrue:
			["Child Squeak"
			p inspect.
			(Delay forMilliseconds: 100) wait.
			OSProcess snapshot: false andQuit: true]
		ifFalse:
			["Parent Squeak process"
			self should: [p isRunning].
			[p isRunning] whileTrue: [(Delay forMilliseconds: 100) wait].
			self should: [p isComplete].
			self should: [p exitStatus == 0].
			self assert: self numberOfOpenFiles == openFileCount]
