testing - external process access
testPrimGetUid

	"(UnixProcessAccessorTestCase selector: #testPrimGetUid) run"

	| id |
	id := accessor primGetUid.
	self should: [id isKindOf: Integer]
