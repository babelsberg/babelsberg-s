testing
testRedirectStdOutTo
	"Perform a dup2() call on the standard output descriptor to assign it
	to a new file stream"

	"(UnixProcessAccessorTestCase selector: #testRedirectStdOutTo) run"

	| out aFileStream contents outFd saveFd newFileNo saveFs |
	out := OSProcess thisOSProcess stdOut.
	"save file number to allow cleanup at end of test"
	OSProcess deleteFileNamed: '/tmp/delete.2.me'.	
	saveFs := FileStream newFileNamed: '/tmp/delete.2.me'.
	outFd := OSProcess accessor primUnixFileNumber: out fileID.
	saveFd := OSProcess accessor primUnixFileNumber: saveFs fileID.
	OSProcess accessor primDup: outFd to: saveFd.
	"Original stdout file descriptor is saved as safeFd, to be restored at end of test"

	OSProcess deleteFileNamed: '/tmp/delete.me'.	
	aFileStream := FileStream newFileNamed: '/tmp/delete.me'.
	"nb - #contentsOfEntireFile closes the file, do not use"
	aFileStream reset.
	self assert: aFileStream upToEnd isEmpty.
	"note - do not close aFileStream as this affects actual stdout"
	out nextPutAll: 'foo'.
	aFileStream reset.
	self assert: aFileStream upToEnd isEmpty.
	OSProcess thisOSProcess redirectStdOutTo: aFileStream.
	out nextPutAll: 'foo'.
	aFileStream reset.
	contents := aFileStream upToEnd.
	self deny: contents isEmpty.
	self assert: contents = 'foo'. "assume noone else is using stdout right now"
	"ensure the we can still find the real stdout"
	self deny: OSProcess thisOSProcess stdOut closed.
	OSProcess thisOSProcess stdOut nextPutAll: 'bar'.
	aFileStream reset.
	contents := aFileStream upToEnd.
	self deny: contents isEmpty.
	self assert: contents = 'foobar'.
	"Restore the original file number. The stdOut stream is cached in ThisOSProcess
	(and should probably be recalculated following a dup2(), so find the real handle
	with getStdOutHandle."
	newFileNo := OSProcess accessor primUnixFileNumber: OSProcess accessor getStdOutHandle.
	OSProcess accessor primDup: saveFd to: newFileNo.
	OSProcess thisOSProcess stdOut lf; nextPutAll: 'UnixProcessAccessorTestCase>>testRedirectStdOutTo - this should appear on original console stdout'; lf.
	saveFs close.
	aFileStream close.	
	OSProcess deleteFileNamed: '/tmp/delete.me'.	
	OSProcess deleteFileNamed: '/tmp/delete.2.me'.	

