file locking
testUnlockFileUnixCompatible

	"(UnixProcessAccessorTestCase selector: #testUnlockFileUnixCompatible) debug"

	| mode fs result |
	mode := OSProcess accessor emulateWin32FileLocking. "remember setting"

	fs := FileStream fileNamed: 'junkfile'.
	[OSProcessAccessor emulateWin32FileLocking: false. "unix mode"
	fs nextPutAll: 'ABCDEFG'.
	result := OSProcess accessor unlockFile: fs.
	"On Unix, the fcntl call to unlock the file will succeed even if
	the file is not locked."
	self should: (result isKindOf: OSFileLock).

	result := OSProcess accessor lockFile: fs.
	self should: (result isKindOf: OSFileLock).
	result := OSProcess accessor unlockFile: fs.
	self should: (result isKindOf: OSFileLock).

	fs close.
	result := OSProcess accessor unlockFile: fs.
	self should: result == nil] ensure:
		[OSProcessAccessor emulateWin32FileLocking: mode.
		fs close]
