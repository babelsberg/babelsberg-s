testing - external process access
testEnvironmentAt

	"(UnixProcessAccessorTestCase selector: #testEnvironmentAt) run"

	| path |
	path := accessor environmentAt: 'PATH'.
	self should: [path notNil and: [path isEmpty not]]