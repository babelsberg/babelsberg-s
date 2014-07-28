testing - external process access
testGetStdErrHandle

	"(UnixProcessAccessorTestCase selector: #testGetStdErrHandle) run"

	| handle |
	handle := accessor primGetStdErrHandle.
	self assert: handle notNil
