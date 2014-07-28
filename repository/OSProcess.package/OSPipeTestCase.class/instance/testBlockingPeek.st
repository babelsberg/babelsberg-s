testing
testBlockingPeek

	"(OSPipeTestCase selector: #testBlockingPeek) run"

	| p |
	p := OSPipe blockingPipe.
	p nextPutAll: 'abc'.
	p flush. "protect against buggy clib that may never flush output"
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
