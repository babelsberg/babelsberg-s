testing - external process access
testPrimGetGid

	"(UnixProcessAccessorTestCase selector: #testPrimGetGid) run"

	| id |
	id := accessor primGetGid.
	self should: [id isKindOf: Integer]
