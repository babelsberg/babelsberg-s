testing
testIsReadable

	"(UnixProcessAccessorTestCase selector: #testIsReadable) run"

	self should: [accessor isReadable: '/bin/sh'].
	OSProcess waitForCommand: 'touch /tmp/delete.me'.
	OSProcess waitForCommand: 'chmod 440 /tmp/delete.me'.
	(Delay forMilliseconds: 200) wait.
	self should: [accessor isReadable: '/tmp/delete.me'].
