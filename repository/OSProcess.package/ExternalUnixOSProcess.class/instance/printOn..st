printing
printOn: aStream

	self programName isNil
		ifTrue:
			[^ super printOn: aStream]
		ifFalse:
			[aStream
				nextPutAll: 'an ';
				nextPutAll: self class name, ' with pid ';
				nextPutAll: self pid printString;
				nextPutAll: ' on ';
				nextPutAll: programName;
				nextPutAll: ' (';
				nextPutAll: self runState asString.
			self isComplete
				ifTrue: [aStream nextPutAll: ', ';
					nextPutAll: (UnixProcessExitStatus for: exitStatus) printString].
			aStream nextPut: $)].
