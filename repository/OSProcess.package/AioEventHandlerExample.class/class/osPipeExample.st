examples
osPipeExample
	"Demonstrate an asynchronous read hander on an OS pipe. Output will
	be displayed on the Transcript."

	"self osPipeExample"

	| pipe aio |
	(Smalltalk hasClassNamed: #OSProcess)
		ifFalse:
			[self notify: 'this example requires OSProcess']
		ifTrue:
			[pipe := (Smalltalk at: #OSPipe) new.
			aio := super new handler: (AioEventHandler for: pipe reader); ioStream: pipe reader.
			aio handler addDependent: aio.
			(1 to: 10) do:
				[:i |
				pipe nextPutAll: 'this is line ', i asString; cr.
				(Delay forMilliseconds: 500) wait].
			^ aio handler close]
