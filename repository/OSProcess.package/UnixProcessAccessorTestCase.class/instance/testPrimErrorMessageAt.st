testing - external process access
testPrimErrorMessageAt

	"(UnixProcessAccessorTestCase selector: #testPrimErrorMessageAt) run"

	| msg |
	msg := accessor primErrorMessageAt: 1.
	self should: [msg notNil and: [msg isEmpty not]].
	msg := accessor primErrorMessageAt: 0.
	self should: [msg notNil and: [msg isEmpty not]]
