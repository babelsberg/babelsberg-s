running
setUp

	"Set system to use Windows file locking semantics. The tearDown method is expected to restore the setting."

	OSProcessAccessor emulateWin32FileLocking: true.
	^ super setUp
