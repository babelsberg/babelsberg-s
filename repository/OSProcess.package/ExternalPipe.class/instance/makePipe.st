initialize-release
makePipe
	"Create an OS pipe and attach it to my input and output streams."

	| handleArray |
	handleArray := OSProcess accessor makePipeHandles.
	handleArray isNil
		ifTrue:
			[self error: 'cannot create OS pipe']
		ifFalse:
			[self reader: (AttachableFileStream
							name: 'pipeReader'
							attachTo: (handleArray at: 1)
							writable: false).
			self writer: (AttachableFileStream
							name: 'pipeWriter'
							attachTo: (handleArray at: 2)
							writable: true)]
