testing
testIsWritable

	"(UnixProcessAccessorTestCase selector: #testIsWritable) run"

	self shouldnt: [accessor isWritable: '/bin/sh'].
	OSProcess waitForCommand: 'touch /tmp/delete.me'.
	OSProcess waitForCommand: 'chmod 770 /tmp/delete.me'.
	(Delay forMilliseconds: 200) wait.
	self should: [accessor isWritable: '/tmp/delete.me'].
