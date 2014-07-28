testing
testNonBlocking

	"(OSPipeTestCase selector: #testNonBlocking) run"

	| p ws str |
	p := OSPipe nonBlockingPipe.
	self writeStuffOnThenClose: p.
	ws := self readFromAndClose: p writingTo: (WriteStream on: String new).
	str := (ws contents last: 16).
	self should: ['this is line 10*' match: str].
	p close
