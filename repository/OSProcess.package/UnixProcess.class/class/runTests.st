unit tests
runTests
	"Run a few tests to see if things are working correctly on Unix/Linux. 
	Output is on stdout, stderr, and the Squeak Transcript. One of the tests 
	requires input from stdin, so Squeak should be run from a shell command
	line and not as a background process.

	Warning: This test will crash your VM if your are using the -xshm command
	line option. For reasons which I do not quite understand, the X shared
	memory segment becomes invalid when the Squeak VM which initially
	opened the shared memory exits. The remaining Squeak children will crash
	when then then next try to update the display.

	Note: If you see 'select: Bad file descriptor' messages on your console standard
	output, these are occuring while running headless in the decapitate/recapitate
	tests.

	Important: Prior to evaluating this method, please type one line of text
	followed by a <cr> on the terminal standard input. This provides the
	input for the stdin test. Failing to provide this input prior to evaluating
	the tests will cause one of the test cases to fail."

	"UnixProcess runTests"

	| this s p failures result a |
	failures := 0.
	Transcript show: 'Begin OSProcess tests'; cr.
	Transcript show: 'Test for working ProcessAccessor ... '.
	this := OSProcess thisOSProcess.
	(this pid isKindOf: Integer)
		ifTrue: [Transcript show: 'OK'; cr]
		ifFalse: [Transcript show: 'NFG'; cr. failures := failures + 1].
	Transcript show: 'Echo one line of text previously entered from stdin ... '.
	s := OSProcess readFromStdIn.
	s size > 0
		ifTrue: [Transcript show: 'OK'; cr; show: s; cr]
		ifFalse: [Transcript show: 'NFG'; cr. failures := failures + 1].
	Transcript show: 'Message to stdout ... '.
	(OSProcess helloWorld isKindOf: AttachableFileStream)
		ifTrue: [Transcript show: 'OK'; cr; show: s; cr]
		ifFalse: [Transcript show: 'NFG'; cr. failures := failures + 1].
	Transcript show: 'Message to stderr ... '.
	(OSProcess helloStdErr isKindOf: AttachableFileStream)
		ifTrue: [Transcript show: 'OK'; cr; show: s; cr]
		ifFalse: [Transcript show: 'NFG'; cr. failures := failures + 1].
	Transcript show: 'UnixProcess cataFile ... '.
	p := UnixProcess catAFile.
	(Delay forSeconds: 1) wait.
	p exitStatus == 0
		ifTrue: [Transcript show: 'OK'; cr]
		ifFalse: [Transcript show: 'NFG'; cr. failures := failures + 1].
	Transcript show: 'UnixProcess testEnvSet ... '.
	p := UnixProcess testEnvSet.
	(Delay forSeconds: 1) wait.
	p exitStatus == 0
		ifTrue: [Transcript show: 'OK'; cr]
		ifFalse: [Transcript show: 'NFG'; cr. failures := failures + 1].
	Transcript show: 'UnixProcess catFromFileToFiles ... '.
	OSProcess command: 'rm /tmp/deleteMe.out'.
	OSProcess command: 'rm /tmp/deleteMe.err'.
	p := UnixProcess catFromFileToFiles.
	(Delay forSeconds: 1) wait.
	p exitStatus == 0
		ifTrue: [Transcript show: 'OK'; cr]
		ifFalse: [Transcript show: 'NFG'; cr. failures := failures + 1].
	Transcript show: 'UnixProcess testRunCommand ... '.
	OSProcess command: 'rm /tmp/deleteMe.out'.
	OSProcess command: 'rm /tmp/deleteMe.err'.
	p := UnixProcess testRunCommand.
	(Delay forSeconds: 1) wait.
	p exitStatus == 256
		ifTrue: [Transcript show: 'OK'; cr]
		ifFalse: [Transcript show: 'NFG'; cr. failures := failures + 1].
	Transcript show: 'UnixProcess testPipe ... '.
	UnixProcess testPipe = 'this is some text to write into the pipe'
		ifTrue: [Transcript show: 'OK'; cr]
		ifFalse: [Transcript show: 'NFG'; cr. failures := failures + 1].
	Transcript show: 'UnixProcess testPipeLine ... '.
	UnixProcess testPipeLine = 'This is the text to write out through one pipe, copy through an external cat command, and then read back in through another pipe.'
		ifTrue: [Transcript show: 'OK'; cr]
		ifFalse: [Transcript show: 'NFG'; cr. failures := failures + 1].
	Transcript show: 'UnixProcess spawnTenHeadlessChildren ... '.
	p := UnixProcess spawnTenHeadlessChildren.
	(p size == 10 and: [(p select: [:e | (e runState == #running) | (e exitStatus == 0)]) size == 10])
		ifTrue: [Transcript show: 'OK'; cr]
		ifFalse: [Transcript show: 'NFG'; cr. failures := failures + 1].
	Transcript show: 'UnixProcess cloneSqueak ... '.
	p := UnixProcess cloneSqueak.
	(p isKindOf: UnixProcess)
		ifTrue: 
			[(Delay forSeconds: 1) wait.
			OSProcess snapshot: false andQuit: true].
	(Delay forSeconds: 5) wait.
	p exitStatus == 0
		ifTrue: [Transcript show: 'OK'; cr]
		ifFalse: [Transcript show: 'NFG'; cr. failures := failures + 1].
	Transcript show: 'UnixProcess squeakSqueak ... '.
	p := UnixProcess squeakSqueak.
	(Delay forSeconds: 5) wait.
	OSProcess thisOSProcess sigkill: p.
	(Delay forSeconds: 1) wait.
	p exitStatus == 9
		ifTrue: [Transcript show: 'OK'; cr]
		ifFalse: [Transcript show: 'NFG'; cr. failures := failures + 1].
	Transcript show: 'UnixProcess restartVirtualMachine ... '.
	p := UnixProcess restartVirtualMachine.
	p pid == OSProcess thisOSProcess pid
		ifTrue: [Transcript show: 'OK'; cr]
		ifFalse: [Transcript show: 'NFG'; cr. failures := failures + 1].
	Transcript show: 'UnixProcess command: ''cat'' input: ''this is some test data'' ... '.
	p := (OSProcess thisOSProcess
		command: 'cat'
		input: 'this is some test data').
	(Delay forSeconds: 1) wait.
	p upToEnd = 'this is some test data'
		ifTrue: [Transcript show: 'OK'; cr]
		ifFalse: [Transcript show: 'NFG'; cr. failures := failures + 1].
	Transcript show: 'UnixProcess waitForCommandOutput: ''echo sleeping...; sleep 1; echo I just slept for one second'' ... '.
	('*I just slept for one second*' match:
		(OSProcess thisOSProcess
			waitForCommandOutput: 'echo sleeping...; sleep 1; echo I just slept for one second'))
		ifTrue: [Transcript show: 'OK'; cr]
		ifFalse: [Transcript show: 'NFG'; cr. failures := failures + 1].
	Transcript show: 'Unix command pipeline with output and error returned in an array ... '.
	(Smalltalk hasClassNamed: #PipeableOSProcess)
		ifTrue:
			[a := (((Smalltalk at: #PipeableOSProcess) command: 'echo this is a test; BOGUS') | 'cut -c11-14') outputAndError.
			(((a isKindOf: Array)
				and: ['test*' match: (a at: 1)])
					and: ['*BOGUS*' match: (a at: 2)])
						ifTrue: [Transcript show: 'OK'; cr]
						ifFalse: [Transcript show: 'NFG'; cr. failures := failures + 1]]
		ifFalse:
			[Transcript show: 'skipping PipeableOSProcess test (requires CommandShell)'; cr].

	Transcript show: 'UnixProcess decapitate and recapatiate five times'; cr.
	5 timesRepeat:
		[UnixProcess decapitate.
		UnixProcess recapitate].

	failures == 1
		ifTrue: [result := 'OSProcess tests completed with ', failures printString, ' failure']
		ifFalse: [result := 'OSProcess tests completed with ', failures printString, ' failures'].
	Transcript show: result; cr.

	^ result
