remote image commands
doRemote: remoteBlock doLocal: localBlock
	"Evaluate remoteBlock in a remote Squeak image. While the remote Squeak is
	still running, evaluate localBlock. When done, terminate the remote Squeak
	image and answer the result of evaluating localBlock."

	"self new
		doRemote: [OSProcess thisOSProcess stdOut nextPutAll: 'hello from child Squeak';
						nextPut: Character lf]
		doLocal: [(Delay forSeconds: 1) wait.
						OSProcess thisOSProcess stdOut nextPutAll: 'hello from parent Squeak';
					nextPut: Character lf]"

	| result |
	self shouldnt: [remoteProcess := OSProcess thisOSProcess forkHeadlessSqueak]
		raise: Warning.
	self assert: remoteProcess notNil. "Fail if fork did not succeed"
	(remoteProcess == OSProcess thisOSProcess)
		ifTrue:
			["remote child Squeak"
			remoteBlock value]
		ifFalse:
			["parent Squeak"
			[[remoteProcess isRunning] whileFalse: [self delay wait].
			self delay wait.
			result := localBlock value]
				ensure:	[remoteProcess terminate.
					[remoteProcess isComplete] whileFalse: [self delay wait].
					self delay wait.
					result]].
	^ result
