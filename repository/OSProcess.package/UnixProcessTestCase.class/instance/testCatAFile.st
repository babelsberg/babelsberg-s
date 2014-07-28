testing - class examples
testCatAFile

	"(UnixProcessTestCase selector: #testCatAFile) run"

	| p openFileCount |
	openFileCount := self numberOfOpenFiles.
	self shouldnt: [p := UnixProcess catAFile]
		raise: Warning.
	self assert: p notNil.
	self should: [p isRunning].
	[p isRunning] whileTrue: [(Delay forMilliseconds: 100) wait].
	self should: [p isComplete].
	self should: [p exitStatus == 0].
	self should: [p initialStdIn closed]. "Used a file for input, should be closed"
	self shouldnt: [p initialStdOut closed]. "Shared stdout with the VM, should be open"
	self shouldnt: [p initialStdErr closed]. "Shared stderr with the VM, should be open"
	self assert: self numberOfOpenFiles == openFileCount
