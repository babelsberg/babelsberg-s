initialization
class: aClass selector: aSymbol

	super class: aClass selector: aSymbol.
	self
		exception: Error;
		handlerBlock: [:receiver :arguments :ex | ].