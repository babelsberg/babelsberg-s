fail blocks
testLockFileRegionIfFail

	"(self selector: #testLockFileRegionIfFail) run"

	| fail |
	fail := false.
	accessor
		lockFile: fileStream from: 100 to: 199 exclusive: true
		ifFail: [fail := true].
	self shouldnt: fail.
	fileStream close.
	accessor
		lockFile: fileStream from: 100 to: 199 exclusive: true
		ifFail: [fail := true].
	self should: fail.
	accessor
		lockFile: fileStream from: 100 to: 199
		ifFail: [fail := true].
	self should: fail
