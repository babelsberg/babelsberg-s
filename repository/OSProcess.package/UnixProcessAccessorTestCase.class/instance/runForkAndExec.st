running
runForkAndExec
	"Most of this must be tested from class UnixProcess"

	"UnixProcessAccessorTestCase new runForkAndExec"

	| result suite |
	suite := TestSuite new.
	suite addTest: (UnixProcessAccessorTestCase selector: #testPrimGetChildExitStatus).
	suite addTest: (UnixProcessAccessorTestCase selector: #testPrimForkAndExec).
	result := suite run.
	self should: [result defects size == 0].
	^ result
