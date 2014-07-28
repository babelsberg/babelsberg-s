testing - external process access
testPrimGetPPid

	"(UnixProcessAccessorTestCase selector: #testPrimGetPPid) run"

	| id |
	id := accessor primGetPPid.
	self should: [id isKindOf: Integer]
