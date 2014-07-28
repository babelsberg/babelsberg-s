testing
testMakePipeHandles

	"(UnixProcessAccessorTestCase selector: #testMakePipeHandles) run"

	| p |
	p := OSPipe new.
	self assert: p reader closed not.
	self assert: p writer closed not.
	p close