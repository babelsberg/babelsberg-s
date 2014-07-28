testing - fork and exec
testPrimGetChildExitStatus
	"Cannot really test this here, because it needs to be wired into the interrupt
	handler. Just make sure it returns nil when there is nothing to do."

	"(UnixProcessAccessorTestCase selector: #testPrimGetChildExitStatus) run"

	| stat |
	stat := accessor primGetChildExitStatus: -1.
	self should: [stat isNil].
	stat := accessor primGetChildExitStatus: 1.
	self should: [stat isNil]
