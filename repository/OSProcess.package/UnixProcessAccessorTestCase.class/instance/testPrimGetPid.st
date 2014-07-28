testing - external process access
testPrimGetPid

	"(UnixProcessAccessorTestCase selector: #testPrimGetPid) run"

	| id |
	id := accessor primGetPid.
	self should: [id isKindOf: Integer]
