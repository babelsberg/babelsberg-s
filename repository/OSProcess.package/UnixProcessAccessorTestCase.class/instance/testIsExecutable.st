testing
testIsExecutable

	"(UnixProcessAccessorTestCase selector: #testIsExecutable) run"

	self should: [accessor isExecutable: '/bin/sh'].
	self shouldnt: [accessor isExecutable: '/etc/hosts']
