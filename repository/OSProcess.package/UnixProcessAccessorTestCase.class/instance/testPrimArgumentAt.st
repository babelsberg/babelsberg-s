testing - external process access
testPrimArgumentAt

	"(UnixProcessAccessorTestCase selector: #testPrimArgumentAt) run"

	| progName |
	progName := accessor primArgumentAt: 1.
	self should: [progName notNil and: [progName isEmpty not]]
