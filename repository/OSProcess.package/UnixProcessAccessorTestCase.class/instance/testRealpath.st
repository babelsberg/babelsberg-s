testing - external process access
testRealpath

	"(UnixProcessAccessorTestCase selector: #testRealpath) run"

	| p |
	p := accessor realpath: '/usr/bin'.
	self should: [p notNil and: [p isEmpty not]].
	p := accessor realpath: '/bogus/path/name'.
	self should: [p isNil]
