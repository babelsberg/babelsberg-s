initialize-release
for: aSocketOrFileStream
	"Answer an event handler for any kind of IO stream that can be associated
	with an OS handle for aio events. Currently, subclasses of FileStream and
	Socket can have aio event handlers."

	(aSocketOrFileStream isKindOf: Socket)
		ifTrue: [^ self forSocket: aSocketOrFileStream].
	(aSocketOrFileStream isKindOf: FileStream)
		ifTrue: [^ self forFileStream: aSocketOrFileStream].
	self error: 'expected a FileStream or Socket subclass'