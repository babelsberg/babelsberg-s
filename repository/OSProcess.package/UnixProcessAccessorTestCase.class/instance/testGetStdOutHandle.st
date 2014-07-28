testing - external process access
testGetStdOutHandle

	"(UnixProcessAccessorTestCase selector: #testGetStdOutHandle) run"

	| handle |
	handle := accessor primGetStdOutHandle.
	self assert: handle notNil
