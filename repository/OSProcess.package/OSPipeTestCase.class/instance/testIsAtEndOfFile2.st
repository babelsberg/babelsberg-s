testing
testIsAtEndOfFile2

	"(OSPipeTestCase selector: #testIsAtEndOfFile2) debug"

	| p s |
	p := OSPipe new.
	[p nextPutAll: 'hello'.
	s := p next: 100.
	self assert: s = 'hello'.
	self deny: p atEndOfFile.
	p closeWriter.
	self deny: p atEndOfFile.
	s := p next: 100.
	self assert: s = ''.
	self assert: p atEndOfFile]
		ensure: [p close]
