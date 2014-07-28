testing
testNonBlockingBufferedPipe

	"(OSPipeTestCase selector: #testNonBlockingBufferedPipe) run"

	| p ws str |
	p := ExternalPipe bufferedNonBlockingPipe.
	[self writeStuffOnThenClose: p.
	self assert: (p peek == nil).
	(Delay forMilliseconds: 100) wait. "allow pipe reads to complete"
	ws := self readFromAndClose: p writingTo: (WriteStream on: String new).
	str := (ws contents last: 16).
	self should: ['this is line 10*' match: str]]
		ensure: [p close]
