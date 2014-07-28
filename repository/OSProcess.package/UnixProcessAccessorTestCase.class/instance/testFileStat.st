testing
testFileStat

	"(UnixProcessAccessorTestCase selector: #testFileStat) run"

	| stat |
	stat := accessor fileStat: '/bin/rm'.
	self assert: (stat isKindOf: Array).
	self assert: (stat size == 3).
	self assert: ((stat at: 1) isKindOf: Integer).
	self assert: ((stat at: 2) isKindOf: Integer).
	self assert: ((stat at: 3) isKindOf: Array).
	self assert: ((stat at: 3) size == 4)
