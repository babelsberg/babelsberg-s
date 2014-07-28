running
setUp

	"Set system to use Unix file locking semantics. The tearDown method is expected to restore the setting."

	OSProcessAccessor emulateWin32FileLocking: false.
	^ super setUp
