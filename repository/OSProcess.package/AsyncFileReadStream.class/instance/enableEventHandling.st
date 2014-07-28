read event handling
enableEventHandling

	self eventHandler: (AioEventHandler aioPluginPresent
		ifTrue: [AioEventHandler
				forFileStream: self
				exceptions: true
				readEvents: true
				writeEvents: false]
		ifFalse: [PseudoAioEventHandler new]).
	self eventHandler addDependent: self