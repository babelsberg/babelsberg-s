testing - external process access
testEnvironmentAtPut1

	"(UnixProcessAccessorTestCase selector: #testEnvironmentAtPut1) run"

	| oldVal newVal resetVal |
	oldVal := accessor environmentAt: 'AAAA'.
	newVal := 'this is a test string'.
	accessor environmentAt: 'AAAA' put: newVal.
	resetVal := accessor environmentAt: 'AAAA'.
	self should: [resetVal notNil and: [resetVal isEmpty not]].
	self should: [newVal = resetVal].
	accessor environmentAt: 'AAAA' put: oldVal.
	self should: [oldVal = (accessor environmentAt: 'AAAA')]
