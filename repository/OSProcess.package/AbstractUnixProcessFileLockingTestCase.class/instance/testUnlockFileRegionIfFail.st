fail blocks
testUnlockFileRegionIfFail

	"(self selector: #testUnlockFileRegionIfFail) run"

	| fail |
	fail := false.
	accessor
		lockFile: fileStream from: 100 to: 199 exclusive: true
		ifFail: [fail := true].
	self shouldnt: fail.
	accessor
		unlockFile: fileStream from: 100 to: 199 exclusive: true
		ifFail: [fail := true].
	self shouldnt: fail.
	fileStream close.
	accessor
		unlockFile: fileStream from: 100 to: 199 exclusive: true
		ifFail: [fail := true].
	self should: fail.
	accessor
		unlockFile: fileStream from: 100 to: 199
		ifFail: [fail := true].
	self should: fail

