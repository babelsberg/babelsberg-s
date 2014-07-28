testing - external process access
testPrimGetSession
	"As of OSPP version 4 and greater, the session ID should always be obtained from
	the interpreter. Previously it was deduced by looking at the handle of an open file."

	"(UnixProcessAccessorTestCase selector: #testPrimGetSession) run"

	| id expectedSessionSize |
	expectedSessionSize := [OSProcess accessor sizeOfInt] on: Error do: [4].
	id := OSProcess accessor primGetSession.
	self assert: (id isNil or: [id isKindOf: ByteArray]).
	id := OSProcess accessor getSessionIdentifier.
	self assert: (id isKindOf: ByteArray).
	self assert: (id size / expectedSessionSize) == 1

