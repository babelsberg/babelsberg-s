running
runExternalProcessAccess

	"UnixProcessAccessorTestCase new runExternalProcessAccess"

	| result suite |
	suite := TestSuite new.
	suite addTest: (UnixProcessAccessorTestCase selector: #testCanAccessSystem).
	suite addTest: (UnixProcessAccessorTestCase selector: #testPrimGetCurrentWorkingDirectory).
	suite addTest: (UnixProcessAccessorTestCase selector: #testChDir).
	suite addTest: (UnixProcessAccessorTestCase selector: #testEnvironmentAt).
	suite addTest: (UnixProcessAccessorTestCase selector: #testEnvironmentAtPut1).
	suite addTest: (UnixProcessAccessorTestCase selector: #testEnvironmentAtPut2).
	suite addTest: (UnixProcessAccessorTestCase selector: #testEnvironmentAtPut).
	suite addTest: (UnixProcessAccessorTestCase selector: #testPrimUnsetEnv).
	suite addTest: (UnixProcessAccessorTestCase selector: #testGetStdInHandle).
	suite addTest: (UnixProcessAccessorTestCase selector: #testGetStdOutHandle).
	suite addTest: (UnixProcessAccessorTestCase selector: #testGetStdErrHandle).
	suite addTest: (UnixProcessAccessorTestCase selector: #testPrimArgumentAt).
	suite addTest: (UnixProcessAccessorTestCase selector: #testPrimErrorMessageAt).
	suite addTest: (UnixProcessAccessorTestCase selector: #testPrimGetPid).
	suite addTest: (UnixProcessAccessorTestCase selector: #testPrimGetGid).
	suite addTest: (UnixProcessAccessorTestCase selector: #testPrimGetEGid).
	suite addTest: (UnixProcessAccessorTestCase selector: #testPrimGetPid).
	suite addTest: (UnixProcessAccessorTestCase selector: #testPrimGetPPid).
	suite addTest: (UnixProcessAccessorTestCase selector: #testPrimGetUid).
	suite addTest: (UnixProcessAccessorTestCase selector: #testPrimGetSession).
	suite addTest: (UnixProcessAccessorTestCase selector: #testRealpath).

	result := suite run.
	self should: [result defects size == 0].
	^ result
