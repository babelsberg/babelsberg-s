sUnit
allTestResults
	"Run all available sUnit tests and save the results in a file named
	'OSProcessTestResults-<platform>.txt'. Display results on the Transcript as
	tests are run. Answer a string with the test results."

	"OSProcess allTestResults"

	| resultsFileName writeStream resultString results fs problems result wordSize |
	self listLoadedModules
		detect: [:e | '*OSProcessPlugin*' match: e]
		ifNone: [self notify: 'no OSProcessPlugin loaded'].
	wordSize := (Smalltalk respondsTo: #wordSize)
		ifTrue: [Smalltalk wordSize]
		ifFalse: [4].
	resultsFileName := 'OSProcessTestResults-' , OSProcess platformName , '-' ,
		(wordSize * 8) asString , 'bitImage-' ,
		(OSProcess accessor sizeOfPointer * 8) asString , 'bitHw.txt'.
	[fs := FileStream newFileNamed: resultsFileName.
	problems := false.
	writeStream := WriteStream on: String new.
	writeStream nextPutAll: self authorInitials , ' running OSProcess unit tests ' , TimeStamp now asString; cr.
	writeStream nextPutAll: 'OSProcess platformName => ' , OSProcess platformName; cr.
	writeStream nextPutAll: 'OSProcess platformSubtype => ' , OSProcess platformSubtype; cr.
	writeStream nextPutAll: 'OSProcess osVersion => ' , OSProcess osVersion; cr.
	writeStream nextPutAll: 'OSProcess vmVersion => ' , OSProcess vmVersion; cr.
	writeStream nextPutAll: 'size of C int: OSProcess accessor sizeOfInt ==> ' , OSProcess accessor sizeOfInt asString; cr.
	writeStream nextPutAll: 'size of C pointer: OSProcess accessor sizeOfPointer ==> ' , OSProcess accessor sizeOfPointer asString; cr.
	writeStream nextPutAll: 'OSProcess versionInformation asString => ' , OSProcess versionInformation asString; cr.
	Transcript show: writeStream contents.
	(((Class allSubInstances select: [:class | #'OSProcess-Tests' = class category]) ,
		(Class allSubInstances select: [:class | #'CommandShell-Tests' = class category]))
			reject: [:class | 'Abstract*' match: class name])
		do: [:testCase | 
			writeStream nextPutAll: 'running tests in ' , testCase name; cr.
			Transcript show: 'running tests in ' , testCase name; cr.
			testCase allTestSelectors
				do: [:testSelector |
					OSProcess thisOSProcess stdOut nextPutAll:
						testCase name, '>>',testSelector, String lf; flush.
					resultString := (testSelector
								-> ([result := (testCase selector: testSelector) run.
									result hasPassed
										ifFalse: [problems := true].
									result]
										on: Error
										do: [:ex | problems := true.
											'caught exception ' , ex printString])) printString.
					writeStream nextPutAll: resultString; cr.
					Transcript show: resultString; cr]].
	problems
		ifTrue: [writeStream nextPutAll: 'one or more problems found'; cr.
			Transcript show: 'one or more problems were found, see results file'; cr]
		ifFalse: [writeStream nextPutAll: 'all tests completed without problems'; cr.
			Transcript show: 'all tests completed without problems'; cr].
	results := writeStream contents copyReplaceAll: String cr with: String lf.
	fs nextPutAll: results]
		ensure: [fs close].
	Transcript show: 'tests results have been saved in a file named ''' , resultsFileName , ''''; cr.
	^ results