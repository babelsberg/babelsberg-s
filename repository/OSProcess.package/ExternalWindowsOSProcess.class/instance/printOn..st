printing
printOn: aStream

	self commandLine isNil
		ifTrue:
			[^ super printOn: aStream]
		ifFalse:
			[aStream
				nextPutAll: 'a ';
				nextPutAll: self class name, ' with pid ';
				nextPutAll: self pid printString.
			(self isComplete and: [handle isNil])
				ifTrue:
					[aStream nextPutAll: ' (handle closed)']
				ifFalse:
					[aStream nextPutAll: ' handle ';
						nextPutAll: (handle isNil
							ifTrue: [handle printString]
							ifFalse: [handle asArray printString])].
			aStream
				nextPutAll: ' on ''';
				nextPutAll: commandLine;
				nextPutAll: ''' (';
				nextPutAll: self runState asString;
				nextPut: $)]

