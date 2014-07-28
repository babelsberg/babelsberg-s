testing - external process access
testGetStdInHandle

	"(UnixProcessAccessorTestCase selector: #testGetStdInHandle) run"

	| handle |
	handle := accessor primGetStdInHandle.
	self assert: handle notNil
