file locking
testOSFileLockTest

	"(UnixProcessAccessorTestCase selector: #testOSFileLockTest) debug"

	| fs fileLock result |
	fs := FileStream fileNamed: 'junkfile'.
	[fs nextPutAll: 'ABCDEFG'.
	fileLock := OSFileLock onFile: fs exclusive: true.
	result := fileLock test.
	self should: (result == true).
	result := fileLock lock.
	self should: (result == true).
	result := fileLock test.
	self should: (result == true).
	result := fileLock unlock.
	self should: (result == true).
	result := fileLock test.
	self should: (result == true).
	fs close.
	result := fileLock test.
	self should: (result == false).
	] ensure: [fs close]
