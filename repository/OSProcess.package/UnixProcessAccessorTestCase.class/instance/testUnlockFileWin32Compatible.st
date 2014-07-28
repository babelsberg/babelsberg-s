file locking
testUnlockFileWin32Compatible

	"(UnixProcessAccessorTestCase selector: #testUnlockFileWin32Compatible) debug"

	| mode fs result |
	mode := OSProcess accessor emulateWin32FileLocking. "remember setting"

	fs := FileStream fileNamed: 'junkfile'.
	[OSProcessAccessor emulateWin32FileLocking: true. "win32 mode"
	fs nextPutAll: 'ABCDEFG'.
	result := OSProcess accessor unlockFile: fs.
	self should: result == nil.

	result := OSProcess accessor lockFile: fs.
	self should: (result isKindOf: OSFileLock).
	result := OSProcess accessor unlockFile: fs.
	self should: (result isKindOf: OSFileLock).

	fs close.
	result := OSProcess accessor unlockFile: fs.
	self should: result == nil] ensure:
		[OSProcessAccessor emulateWin32FileLocking: mode.
		fs close]
