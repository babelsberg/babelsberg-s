testing - external process access
testPrimGetEGid

	"(UnixProcessAccessorTestCase selector: #testPrimGetEGid) run"

	| id |
	id := accessor primGetEGid.
	self should: [id isKindOf: Integer]
