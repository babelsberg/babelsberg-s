testing - external process access
testChDir

	"(UnixProcessAccessorTestCase selector: #testChDir) run"

	| cwd new |
	cwd := accessor primGetCurrentWorkingDirectory.
	new := '/bin'. "nb Do not use /tmp because OS X implements it as a sym link to private/tmp"
	accessor chDir: new.
	self should: [new = accessor primGetCurrentWorkingDirectory].
	accessor chDir: cwd.
	self should: [cwd = accessor primGetCurrentWorkingDirectory].
