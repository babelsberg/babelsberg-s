testing
testIsAtEndOfFile

	"(OSPipeTestCase selector: #testIsAtEndOfFile) debug"

	| p |
	p := OSPipe new.
	self primTestEndOfFileFlag: p reader fileID. "check that OSPP is updated"
	self deny: (OSProcess accessor isAtEndOfFile: p reader fileID).
	self deny: p reader atEnd.
	self deny: p atEnd.
	self assert: (p reader basicNext == nil).
	self deny: (OSProcess accessor isAtEndOfFile: p reader fileID).
	self deny: p reader atEnd.
	self deny: p atEnd.
	p writer nextPut: $X.
	self assert: (p reader basicNext == $X).
	self deny: (OSProcess accessor isAtEndOfFile: p reader fileID).
	self deny: p reader atEnd.
	self deny: p atEnd.
	self assert: (p reader basicNext == nil).
	self deny: (OSProcess accessor isAtEndOfFile: p reader fileID).
	self deny: p reader atEnd.
	self deny: p atEnd.

	p writer close.
	self deny: (OSProcess accessor isAtEndOfFile: p reader fileID).
	self deny: p atEndOfFile. "no read yet, so flag has not been set"
	self deny: p reader atEnd.
	self assert: p atEnd. "writer closed and read gives nil"

	self assert: (p reader basicNext == nil). "read operation should set flag"
	self assert: (OSProcess accessor isAtEndOfFile: p reader fileID).
	self deny: p reader atEnd. "#atEnd does not detect EOF on a pipe"
	self assert: p reader atEndOfFile.
	self assert: p atEnd.
	p close
