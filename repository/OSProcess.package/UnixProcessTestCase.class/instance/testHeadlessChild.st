testing - class examples
testHeadlessChild

	"(UnixProcessTestCase selector: #testHeadlessChild) run"

	| p openFileCount |
	openFileCount := self numberOfOpenFiles.
	self shouldnt: [p := UnixProcess headlessChild]
		raise: Warning. "Catch warning if fork fails"
	[p isComplete] whileFalse: [(Delay forMilliseconds: 100) wait].
	self assert: p isComplete.
	self assert: p exitStatus == 0.
	self assert: self numberOfOpenFiles == openFileCount
