initialize-release
emulateWin32FileLocking: trueOrFalse
	"This is a preference that controls whether file locking will attempt to emulation
	Win32 behavior, in which a lock request will fail if the requested region overlaps
	a region for which there is an existing lock. This behavior is valid only for locks
	managed within a single Squeak image, and will not produce the expected results
	for a Squeak image cooperating with another Squeak image, or with some other
	external program.

	Use of the Win32 emulation may result in performance penalties for an application
	that performs a large number of lock requests, such as a database."

	"self emulateWin32FileLocking: true"
	"self emulateWin32FileLocking: false"

	EmulateWin32FileLocking := trueOrFalse
