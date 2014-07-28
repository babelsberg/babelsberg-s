testing - external process access
testPrimUnsetEnv

	"(UnixProcessAccessorTestCase selector: #testPrimUnsetEnv) run"

	| oldVal newVal resetVal |
	oldVal := accessor environmentAt: 'AAAA'.
	newVal := 'this is a test string'.
	accessor environmentAt: 'AAAA' put: newVal.
	resetVal := accessor environmentAt: 'AAAA'.
	self should: [resetVal notNil and: [resetVal isEmpty not]].
	self should: [newVal = resetVal].

	accessor primUnsetEnv: 'AAAA', (Character value: 0) asString.
	resetVal := accessor environmentAt: 'AAAA'.
	self should: [resetVal isNil].

	accessor environmentAt: 'AAAA' put: oldVal.
	self should: [oldVal = (accessor environmentAt: 'AAAA')]
