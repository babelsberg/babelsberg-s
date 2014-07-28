file locking
testLockFile

	"(UnixProcessAccessorTestCase selector: #testLockFile) debug"

	| fs result |
	fs := FileStream fileNamed: 'junkfile'.
	[fs nextPutAll: 'ABCDEFG'.
	result := OSProcess accessor lockFile: fs.
	self should: (result isKindOf: OSFileLock).
	fs close.
	result := OSProcess accessor lockFile: fs.
	self should: (result == nil).
	] ensure: [fs close]
