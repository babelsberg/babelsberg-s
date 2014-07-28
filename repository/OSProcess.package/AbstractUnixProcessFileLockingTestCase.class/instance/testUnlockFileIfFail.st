fail blocks
testUnlockFileIfFail

	"(self selector: #testUnlockFileIfFail) run"

	| fail |
	fail := false.
	accessor lockFile: fileStream ifFail: [fail := true].
	self shouldnt: fail.
	accessor unlockFile: fileStream ifFail: [fail := true].
	self shouldnt: fail.
	fileStream close.
	accessor unlockFile: fileStream ifFail: [fail := true].
	self should: fail
