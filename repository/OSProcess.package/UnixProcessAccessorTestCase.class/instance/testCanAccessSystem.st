testing
testCanAccessSystem

	"(UnixProcessAccessorTestCase selector: #testCanAccessSystem) run"

	self assert: accessor canAccessSystem