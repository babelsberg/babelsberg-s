testing - external process access
testPrimGetCurrentWorkingDirectory

	"(UnixProcessAccessorTestCase selector: #testPrimGetCurrentWorkingDirectory) run"

	| cwd |
	cwd := accessor primGetCurrentWorkingDirectory.
	self should: [cwd notNil and: [cwd isEmpty not]]