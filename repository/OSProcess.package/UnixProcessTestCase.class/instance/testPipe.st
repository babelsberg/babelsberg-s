testing - class examples
testPipe

	"(UnixProcessTestCase selector: #testPipe) run"

	| openFileCount |
	openFileCount := self numberOfOpenFiles.
	self should: [UnixProcess testPipe = 'this is some text to write into the pipe'].
	self assert: self numberOfOpenFiles == openFileCount
