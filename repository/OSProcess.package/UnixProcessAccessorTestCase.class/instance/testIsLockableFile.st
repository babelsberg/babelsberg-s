file locking
testIsLockableFile

	"(UnixProcessAccessorTestCase selector: #testIsLockableFile) debug"

	| fs result |
	fs := FileStream fileNamed: 'junkfile'.
	[fs nextPutAll: 'ABCDEFG'.

	result := OSProcess accessor isLockableFile: fs.
	self should: result.

	result := OSProcess accessor lockFile: fs.
	self should: (result isKindOf: OSFileLock).
	result := OSProcess accessor isLockableFile: fs.
	self should: result.

	OSProcess accessor unlockFile: fs.
	result := OSProcess accessor isLockableFile: fs.
	self should: result.

	fs close.
	result := OSProcess accessor isLockableFile: fs.
	self shouldnt: result.
	] ensure: [fs close]
