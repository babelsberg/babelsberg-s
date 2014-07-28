fail blocks
testLockFileIfFail

	"(self selector: #testLockFileIfFail) run"

	| fail |
	fail := false.
	accessor lockFile: fileStream ifFail: [fail := true].
	self shouldnt: fail.
	fileStream close.
	accessor lockFile: fileStream ifFail: [fail := true].
	self should: fail
