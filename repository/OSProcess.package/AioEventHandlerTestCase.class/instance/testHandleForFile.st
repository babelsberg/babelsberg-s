testing
testHandleForFile

	| eventHandler anOpenFile fileHandle |
	eventHandler := AioEventHandler new.
	anOpenFile := SourceFiles at: 1.
	fileHandle := eventHandler handleForFile: anOpenFile.
	self assert: fileHandle notNil.
	self assert: (fileHandle isKindOf: Integer)
