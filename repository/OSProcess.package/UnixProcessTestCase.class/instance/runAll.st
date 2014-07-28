running
runAll
	"If you get intermittent failures, try doing a garbage collect. Some of these
	tests can fail intermittently on the open file handle count checks"

	"UnixProcessTestCase new runAll"

	| result suite |
	Smalltalk garbageCollect.
	suite := TestSuite new.
	suite addTest: (UnixProcessTestCase selector: #testClassForkSqueak).
	suite addTest: (UnixProcessTestCase selector: #testClassForkSqueakAndDo).
	suite addTest: (UnixProcessTestCase selector: #testClassForkSqueakAndDoThenQuit).
	suite addTest: (UnixProcessTestCase selector: #testClassForkHeadlessSqueakAndDo).
	suite addTest: (UnixProcessTestCase selector: #testClassForkHeadlessSqueakAndDoThenQuit).
	suite addTest: (UnixProcessTestCase selector: #testForkSqueak).
	suite addTest: (UnixProcessTestCase selector: #testForkSqueakAndDo).
	suite addTest: (UnixProcessTestCase selector: #testForkSqueakAndDoThenQuit).
	suite addTest: (UnixProcessTestCase selector: #testForkHeadlessSqueakAndDo).
	suite addTest: (UnixProcessTestCase selector: #testForkHeadlessSqueakAndDoThenQuit).
	suite addTest: (UnixProcessTestCase selector: #testHeadlessChild).
	suite addTest: (UnixProcessTestCase selector: #testSpawnTenHeadlessChildren).
	suite addTest: (UnixProcessTestCase selector: #testEightLeafSqueakTree).
	suite addTest: (UnixProcessTestCase selector: #testCatAFile).
	suite addTest: (UnixProcessTestCase selector: #testCatFromFileToFiles).
	suite addTest: (UnixProcessTestCase selector: #testRunCommand).
	suite addTest: (UnixProcessTestCase selector: #testPipe).
	suite addTest: (UnixProcessTestCase selector: #testPipeLine).

	result := suite run.
	self should: [result defects size == 0].
	^ result
