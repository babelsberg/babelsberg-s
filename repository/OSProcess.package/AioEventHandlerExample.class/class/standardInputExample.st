examples
standardInputExample
	"Enter lines on stdin, and watch them show up on the Transcript."

	"self standardInputExample"

	| aio stdin |
	(Smalltalk hasClassNamed: #OSProcess)
		ifFalse:
			[self notify: 'this example requires OSProcess']
		ifTrue:
			[Transcript cr; show: ''.
			stdin := (Smalltalk at: #OSProcess) thisOSProcess stdIn.
			aio := super new handler: (AioEventHandler for: stdin); ioStream: stdin.
			aio handler addDependent: aio.
			self notify: 'Enter lines on standard input, watch the Transcript, and select "Proceed" when done'.
			^ aio handler close]
