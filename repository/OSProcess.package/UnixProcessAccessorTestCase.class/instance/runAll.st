running
runAll

	"UnixProcessAccessorTestCase new runAll"

	| result suite |
	suite := TestSuite new.
	suite addTest: (UnixProcessAccessorTestCase selector: #testSessionIdentifier).
	suite addTest: (UnixProcessAccessorTestCase selector: #testCanAccessSystem).
	suite addTest: (UnixProcessAccessorTestCase selector: #testMakePipeHandles).
	suite addTest: (UnixProcessAccessorTestCase selector: #testUnixFileNumber).
	suite addTest: (UnixProcessAccessorTestCase selector: #testFileProtectionMask).
	suite addTest: (UnixProcessAccessorTestCase selector: #testFileStat).
	suite addTest: (UnixProcessAccessorTestCase selector: #testIsExecutable).
	suite addTest: (UnixProcessAccessorTestCase selector: #testIsExecutableForUserInGroup).
	suite addTest: (UnixProcessAccessorTestCase selector: #testIsReadable).
	suite addTest: (UnixProcessAccessorTestCase selector: #testIsReadableForUserInGroup).
	suite addTest: (UnixProcessAccessorTestCase selector: #testIsWritable).
	suite addTest: (UnixProcessAccessorTestCase selector: #testIsWritableForUserInGroup).

	suite addTest: (UnixProcessAccessorTestCase selector: #runExternalProcessAccess).
	suite addTest: (UnixProcessAccessorTestCase selector: #runForkAndExec).

	result := suite run.
	self should: [result defects size == 0].
	^ result
