testing - external process access
testPrimGetEUid

	"(UnixProcessAccessorTestCase selector: #testPrimGetEUid) run"

	| id |
	id := accessor primGetEUid.
	self should: [id isKindOf: Integer]
