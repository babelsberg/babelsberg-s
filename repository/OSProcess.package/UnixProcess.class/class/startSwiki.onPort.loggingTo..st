utility
startSwiki: aSwiki onPort: num loggingTo: aFileName
	"Start a swiki in a headless Squeak image."

	"UnixProcess startSwiki: 'myswiki' onPort: 8081 loggingTo: 'log.txt'"

	| proc |
	(Smalltalk hasClassNamed: #SwikiAction)
		ifTrue:
			[proc := self forkSqueakAndDo:
				[(Smalltalk at: #SwikiAction) new restore: 'myswiki'.
				(Smalltalk at: #PWS) serveOnPort: num loggingTo: aFileName.
				UnixProcess decapitate].
			proc ifNil: [self noAccessorAvailable].
			^ proc]
		ifFalse:
		[self notify: 'PWS not installed in this image']
