updating
getAvailableData
	"Obtain all available data from ioStream. For a FileStream, keep reading until
	a line terminator is reached. This allows use with a FileStream that has not been
	set for nonblocking input."

	| ws c buffer n |
	buffer := String new: 4000.
	(self ioStream isKindOf: FileStream)
		ifTrue:
			[ws := WriteStream on: String new.
			[c := ioStream next.
			(c == Character lf)
				ifTrue: [ws nextPut: Character cr]
				ifFalse: [ws nextPut: c].
			(c ~= Character lf) and: [c ~= Character cr]] whileTrue.
			^ ws contents]
		ifFalse:
			[ioStream dataAvailable
				ifTrue:
					[n := ioStream receiveDataInto: buffer.
					^ buffer copyFrom: 1 to: n]
				ifFalse:
					[^ '']]
