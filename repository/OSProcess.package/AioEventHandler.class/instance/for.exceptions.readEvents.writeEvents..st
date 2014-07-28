initialize-release
for: aSocketOrFileStream exceptions: exceptionEventFlag readEvents: readEventFlag writeEvents: writeEventFlag
	"Answer an event handler for any kind of IO stream that can be associated
	with an OS handle for aio events. Currently, subclasses of FileStream and
	Socket can have aio event handlers."

	(aSocketOrFileStream isKindOf: Socket)
		ifTrue: [^ self forSocket: aSocketOrFileStream
					exceptions: exceptionEventFlag
					readEvents: readEventFlag
					writeEvents: writeEventFlag].
	(aSocketOrFileStream isKindOf: FileStream)
		ifTrue: [^ self forFileStream: aSocketOrFileStream
					exceptions: exceptionEventFlag
					readEvents: readEventFlag
					writeEvents: writeEventFlag].
	self error: 'expected a FileStream or Socket subclass'