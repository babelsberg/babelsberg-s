testing
testNonBlockingPeek

	"(OSPipeTestCase selector: #testNonBlockingPeek) run"

	| p |
	p := OSPipe nonBlockingPipe.
	p nextPutAll: 'abc'.
	self assert: (p peek == $a).
	self assert: (p next == $a).
	self assert: (p peek == $b).
	self assert: (p next == $b).
	self assert: (p peek == $c).
	self deny: p atEnd.
	self assert: (p next == $c).
	self deny: p atEnd.
	p closeWriter.
	self assert: p atEnd.
	p close
