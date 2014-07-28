testing
testFileProtectionMask

	"(UnixProcessAccessorTestCase selector: #testFileProtectionMask) run"

	| mask |
	mask := accessor fileProtectionMask: '/bin/rm'.
	self assert: (mask isKindOf: Array).
	self assert: (mask size == 4)
