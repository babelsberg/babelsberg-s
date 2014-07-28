version dependent
directoryEntryNames: path

	^ self useFileSystem
		ifTrue: [ (path perform: #asFileReference) children collect: [:e | e perform: #basename] ]
		ifFalse: [ ((Smalltalk at: #FileDirectory) on: path) entries collect: [:e | e name] ]
