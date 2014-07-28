testing
testBlocking

	"(OSPipeTestCase selector: #testBlocking) run"

	| p |
	p := OSPipe blockingPipe.
	(1 to: 10) do: [:i | p nextPutAll: 'this is line ', i printString; cr].
	p flush. "protect against buggy clib that may never flush output"
	self should: ['this is line 1*' match: (p next: 15)].
	self should: ['this is line 2*' match: (p next: 15)].
	self should: ['this is line 3*' match: (p next: 15)].
	self should: ['this is line 4*' match: (p next: 15)].
	self should: ['this is line 5*' match: (p next: 15)].
	self should: ['this is line 6*' match: (p next: 15)].
	self should: ['this is line 7*' match: (p next: 15)].
	self should: ['this is line 8*' match: (p next: 15)].
	self should: ['this is line 9*' match: (p next: 15)].
	p writer close.
	self shouldnt: p atEnd.
	self should: ['this is line 10*' match: (p next: 16)].
	self should: p atEnd.
	p close
