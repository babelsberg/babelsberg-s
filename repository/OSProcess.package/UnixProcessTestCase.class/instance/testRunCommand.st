testing - class examples
testRunCommand

	"(UnixProcessTestCase selector: #testRunCommand) run"

	| p f openFileCount |
	openFileCount := self numberOfOpenFiles.
	OSProcess deleteFileNamed: '/tmp/deleteMe.out'.
	OSProcess deleteFileNamed: '/tmp/deleteMe.err'.
	self shouldnt: [p := UnixProcess testRunCommand]
		raise: Warning.
	self assert: p notNil.
	self should: [p isRunning].
	[p isRunning] whileTrue: [(Delay forMilliseconds: 100) wait].
	self should: [p isComplete].
	self should: [p exitStatus > 0].	"Forced an error exit status"
	"stdin was shared with the Squeak VM, so it should not have been closed."
	self shouldnt: [p initialStdIn closed].
	"but the output and error streams should have been closed."
	self should: [p initialStdOut closed].
	self should: [p initialStdErr closed].
	f := FileStream oldFileNamed: '/tmp/deleteMe.out'.
	self shouldnt: [f upToEnd isEmpty].
	f close.
	f := FileStream oldFileNamed: '/tmp/deleteMe.err'.
	self shouldnt: [f upToEnd isEmpty].
	f close.
	self assert: self numberOfOpenFiles == openFileCount


