testing - class examples
testCatFromFileToFiles

	"(UnixProcessTestCase selector: #testCatFromFileToFiles) run"

	| p f openFileCount |
	openFileCount := self numberOfOpenFiles.
	OSProcess deleteFileNamed: '/tmp/deleteMe.out'.
	OSProcess deleteFileNamed: '/tmp/deleteMe.err'.
	self shouldnt: [p := UnixProcess catFromFileToFiles]
		raise: Warning.
	self assert: p notNil.
	self should: [p isRunning].
	[p isRunning] whileTrue: [(Delay forMilliseconds: 100) wait].
	self should: [p isComplete].
	self should: [p exitStatus == 0].
	self should: [p initialStdIn closed].
	self should: [p initialStdOut closed].
	self should: [p initialStdErr closed].
	f := FileStream oldFileNamed: '/tmp/deleteMe.out'.
	self shouldnt: [f upToEnd isEmpty].
	f close.
	f := FileStream oldFileNamed: '/tmp/deleteMe.err'.
	self should: [f upToEnd isEmpty].
	f close.
	self assert: self numberOfOpenFiles == openFileCount
