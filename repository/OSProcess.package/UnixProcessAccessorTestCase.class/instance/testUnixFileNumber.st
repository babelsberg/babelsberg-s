testing
testUnixFileNumber
	"For purposes of this test, assume that stdin and stderr have not been
	directed."

	"(UnixProcessAccessorTestCase selector: #testUnixFileNumber) run"

	| err errFileNo errHandle in inFileNo inHandle aFileStream fFileNo fHandle |
	err := OSProcess thisOSProcess stdErr.
	errHandle := err fileID.
	errFileNo := OSProcess accessor unixFileNumber: errHandle.
	self assert: errFileNo == 2.
	in := OSProcess thisOSProcess stdIn.
	inHandle := in fileID.
	inFileNo := OSProcess accessor unixFileNumber: inHandle.
	self assert: inFileNo == 0.
	aFileStream := FileStream fileNamed: '/tmp/delete.me'.
	fHandle := aFileStream fileID.
	fFileNo := OSProcess accessor unixFileNumber: fHandle.
	self assert: fFileNo notNil.
	self assert: fFileNo > 2.
	aFileStream close

