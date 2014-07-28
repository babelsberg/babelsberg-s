testing
testIsWritableForUserInGroup

	"(UnixProcessAccessorTestCase selector: #testIsWritableForUserInGroup) run"

	self shouldnt: [OSProcess waitForCommand: 'touch /tmp/delete.me']
		raise: Warning.
	OSProcess waitForCommand: 'chmod 770 /tmp/delete.me'.
	"explicitly set file group because OS X may have set it to something other than current gid"
	OSProcess waitForCommand: 'chgrp ', accessor primGetGid asString, ' /tmp/delete.me'.
	self shouldnt: [accessor isWritable: '/bin/sh'
					forUser: accessor primGetUid
					inGroup: accessor primGetGid].
	self should: [accessor isWritable: '/tmp/delete.me'
					forUser: accessor primGetUid
					inGroup: 99999].
	self should: [accessor isWritable: '/tmp/delete.me'
					forUser: 99999
					inGroup: accessor primGetGid].
	self shouldnt: [accessor isWritable: '/tmp/delete.me'
					forUser: 99999
					inGroup: 99999].
	OSProcess deleteFileNamed: '/tmp/delete.me'
