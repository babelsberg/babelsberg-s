file locking
testOSFileRegionLockTest

	"(UnixProcessAccessorTestCase selector: #testOSFileRegionLockTest) debug"

	| fs fileLock result |
	fs := FileStream fileNamed: 'junkfile'.
	[fs nextPutAll: 'ABCDEFG'.
	fileLock := OSFileRegionLock onFile: fs from: 2 to: 4 exclusive: true.
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
