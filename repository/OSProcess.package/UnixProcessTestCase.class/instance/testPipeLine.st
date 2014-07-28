testing - class examples
testPipeLine

	"(UnixProcessTestCase selector: #testPipeLine) run"

	| openFileCount |
	openFileCount := self numberOfOpenFiles.
	self should: ['This is the text to write*' match: UnixProcess testPipeLine].
	self assert: self numberOfOpenFiles == openFileCount
