testing
testDupTo
	"Perform a dup2() call to assign IO to a new file stream"

	"(UnixProcessAccessorTestCase selector: #testDupTo) run"

	| f1 f2 fd1 fd2 result contents1 contents2 |
	OSProcess deleteFileNamed: '/tmp/delete-1.me'.	
	OSProcess deleteFileNamed: '/tmp/delete-2.me'.	
	f1 := FileStream newFileNamed: '/tmp/delete-1.me'.
	f2 := FileStream newFileNamed: '/tmp/delete-2.me'.
	fd1 := OSProcess accessor primUnixFileNumber: f1 fileID.
	fd2 := OSProcess accessor primUnixFileNumber: f2 fileID.
	result := OSProcess accessor primDup: fd1 to: fd2.
	"f1 and f2 now both refer to the same IO stream"
	self assert: result = fd2.
	f2 nextPutAll: 'write something to the original f2 file stream that will appear in duped f1 instead'.
	f1 reset.
	contents1 := f1 upToEnd.
	self deny: contents1 isEmpty.
	self assert: ('write something*' match: contents1).
	f2 reset.
	contents2 := f2 upToEnd.
	self deny: contents2 isEmpty.
	self assert: ('write something*' match: contents2).
	f1 close.
	f2 close.
	"check the contents of the actual files"
	contents1 := (FileStream fileNamed: '/tmp/delete-1.me') contentsOfEntireFile.
	self assert: ('write something*' match: contents1).
	contents2 := (FileStream fileNamed: '/tmp/delete-2.me') contentsOfEntireFile.
	self assert: contents2 isEmpty.
	OSProcess deleteFileNamed: '/tmp/delete-1.me'.	
	OSProcess deleteFileNamed: '/tmp/delete-2.me'.	
